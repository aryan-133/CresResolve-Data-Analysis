# Relational Model & Grain Analysis

Based on the initial data inventory, here is the grain of each table and the relationship map.

## Table Grains

### Core Entities
* **`borrowers.csv`**: Grain is `borrower_id`. Note: 600 duplicate rows found. 11,015 distinct borrowers.
* **`accounts.csv`**: Grain is `account_id`. 30,000 accounts. A borrower can have multiple accounts (10,943 distinct `borrower_id` mapped).
* **`agents.csv`**: Grain is *not* `agent_id` strictly, but it represents the agent entity. 30,000 rows but only 1,000 distinct `agent_id`s and 1,099 `employee_code`s. This points to historical changes or data duplication. We need entity resolution here.
* **`vendor_telephony.csv`**: Grain is `vendor_id` / `vendor_account_id`. 15 rows.

### Interactions & Events
* **`calls.csv`**: Grain is `call_id`. 90,000 distinct calls, but 1,271 duplicate rows. Contains `account_id`, `borrower_id`, `agent_id`, `campaign_id`.
* **`call_attempts.csv`**: Grain is `attempt_id`. 120,000 attempts mapping to 66,244 `call_id`s. Indicates multiple attempts per call record or vice versa.
* **`call_dispositions.csv`**: Grain is `disposition_id`. 35,000 rows mapping to 28,971 `call_id`s.
* **`promises_to_pay.csv`**: Grain is `ptp_id`. 18,000 PTP events.
* **`payments.csv`**: Grain is `payment_id` (wait, `payment_id` is not unique according to inventory? The inventory shows 25,000 distinct `payment_id`s out of 25,500 rows, and 486 duplicate rows). Grain should be `payment_id`, but we have duplicates to resolve.
* **`sms_events.csv`**: Grain is `sms_event_id`. 45,000 events.
* **`whatsapp_events.csv`**: Grain is `whatsapp_event_id`. 60,000 distinct IDs out of 60,600 rows (600 duplicate rows).
* **`field_visits.csv`**: Grain is `visit_id`. 25,000 visits.
* **`complaints.csv`**: Grain is `complaint_id`. 8,000 complaints.
* **`account_status_history.csv`**: Grain is `history_id`. 60,000 status changes.
* **`agent_sessions.csv`**: Grain is `session_id`. 15,000 sessions mapping to 1,000 agents.

### Planning & Strategy
* **`campaigns.csv`**: Grain is `campaign_id`. 120 campaigns.
* **`daily_targeting.csv`**: Grain is `target_id`. 45,000 targeting events across 23,344 accounts.

## Expected Relationships

```text
borrowers (1) -> (M) accounts
campaigns (1) -> (M) daily_targeting
accounts (1) -> (M) daily_targeting
accounts (1) -> (M) calls
calls (1) -> (M) call_attempts
calls (1) -> (M) call_dispositions
accounts (1) -> (M) promises_to_pay
accounts (1) -> (M) payments
agents (1) -> (M) agent_sessions
agents (1) -> (M) calls
```

## Anomalies Detected in Phase 1
1. **Duplicate Rows**: `borrowers.csv` (600), `calls.csv` (1271), `payments.csv` (486), `whatsapp_events.csv` (600). These need strict deduplication in the staging layer.
2. **Payment Grain**: `payment_id` is not perfectly unique. There are 25,500 rows but only 25,000 distinct `payment_id`s. This confirms the need for forensic deduplication.
3. **Agent Grain**: `agents.csv` has 30,000 rows but only 1,000 distinct `agent_id`s. We cannot join on `agent_id` without resolving the dimension first (Type 2 SCD or duplicates).

## Next Steps: Phase 2 (Staging & Forensics)
1. Ingest all CSVs into a local DuckDB database (`data/db/collections.db`), removing exact row duplicates.
2. Build the `01_staging.sql` layer with basic type casting and timezone standardization.
3. Perform **Entity Resolution** on Agents.
4. Perform **Payment Deduplication** (classifying true dupes, retries, etc.).
5. Present the results of deduplication and entity resolution before moving to attribution.
