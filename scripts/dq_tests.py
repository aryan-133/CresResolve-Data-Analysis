import duckdb
import pytest
import os

DB_PATH = "data/db/collections.db"

@pytest.fixture(scope="module")
def con():
    if not os.path.exists(DB_PATH):
        pytest.skip(f"Database {DB_PATH} does not exist.")
    connection = duckdb.connect(DB_PATH)
    yield connection
    connection.close()

def test_no_duplicate_accounts(con):
    result = con.execute("SELECT count(*), count(distinct account_id) FROM stg_accounts").fetchone()
    assert result[0] == result[1], "Duplicate account_ids found in staging"

def test_golden_dataset_grain(con):
    # Ensure no exact duplicates on account_id, month_val
    result = con.execute("""
        SELECT max(cnt) FROM (
            SELECT count(*) as cnt FROM golden_dataset GROUP BY account_id, month_val
        )
    """).fetchone()
    assert result[0] == 1, "Join explosion in golden_dataset: multiple records per account-month"

def test_no_negative_payments(con):
    result = con.execute("SELECT count(*) FROM fct_payments WHERE amount < 0").fetchone()
    assert result[0] == 0, "Negative payments found in clean facts"

def test_payment_reconciliation(con):
    # The total distinct payments should map back minus explicitly classified retries
    raw = con.execute("SELECT count(*) FROM stg_payments").fetchone()[0]
    unique_and_legit = con.execute("SELECT count(*) FROM fct_payments").fetchone()[0]
    retries = con.execute("SELECT count(*) FROM fct_payments_classified WHERE payment_classification = 'retry_ingestion_duplicate'").fetchone()[0]
    
    assert raw == unique_and_legit + retries, "Payment counts do not reconcile after deduplication"
