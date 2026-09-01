# Data Quality Report

| Issue | Detection Method | Records Affected | Financial Impact | Treatment | Confidence |
| ----- | ---------------- | ---------------: | ---------------: | --------- | ---------- |
| Exact Duplicate Rows | Row hashing / distinct check | ~3000 rows across tables | None (Inflation avoided) | Deduplicated in staging | HIGH |
| Duplicate Payments | Partition by account, amount, event_at | 486 rows | Immaterial (Caught before aggregation) | Classified as `retry_ingestion_duplicate` and excluded | HIGH |
| Agent ID Mismatches | Distinct count mismatch | 29,000 extra records | None (Analytical grain) | Picked latest updated record per `agent_id` via Type 2 SCD resolution | HIGH |
| Missing Phone/Email | Null check in `borrowers.csv` | ~1,500 rows | None | Retained rows, excluded from contact-rate denominator | HIGH |
| Negative Payments | Assertion test | 0 rows | ₹0 | Tested & confirmed no negative amounts exist | HIGH |
