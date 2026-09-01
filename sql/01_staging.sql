-- 01_staging.sql
-- Create staging tables from raw CSVs, removing exact duplicates.

-- Accounts
CREATE OR REPLACE TABLE stg_accounts AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/accounts.csv');

-- Account Status History
CREATE OR REPLACE TABLE stg_account_status_history AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/account_status_history.csv');

-- Agents
CREATE OR REPLACE TABLE stg_agents AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/agents.csv');

-- Agent Sessions
CREATE OR REPLACE TABLE stg_agent_sessions AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/agent_sessions.csv');

-- Borrowers
CREATE OR REPLACE TABLE stg_borrowers AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/borrowers.csv');

-- Calls
CREATE OR REPLACE TABLE stg_calls AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/calls.csv');

-- Call Attempts
CREATE OR REPLACE TABLE stg_call_attempts AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/call_attempts.csv');

-- Call Dispositions
CREATE OR REPLACE TABLE stg_call_dispositions AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/call_dispositions.csv');

-- Campaigns
CREATE OR REPLACE TABLE stg_campaigns AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/campaigns.csv');

-- Complaints
CREATE OR REPLACE TABLE stg_complaints AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/complaints.csv');

-- Daily Targeting
CREATE OR REPLACE TABLE stg_daily_targeting AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/daily_targeting.csv');

-- Field Visits
CREATE OR REPLACE TABLE stg_field_visits AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/field_visits.csv');

-- Payments
CREATE OR REPLACE TABLE stg_payments AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/payments.csv');

-- Promises to Pay
CREATE OR REPLACE TABLE stg_promises_to_pay AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/promises_to_pay.csv');

-- SMS Events
CREATE OR REPLACE TABLE stg_sms_events AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/sms_events.csv');

-- Vendor Telephony
CREATE OR REPLACE TABLE stg_vendor_telephony AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/vendor_telephony.csv');

-- WhatsApp Events
CREATE OR REPLACE TABLE stg_whatsapp_events AS 
SELECT DISTINCT * FROM read_csv_auto('data/raw/whatsapp_events.csv');
