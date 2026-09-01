-- 06_golden_dataset.sql
-- Create golden dataset at account-month grain

CREATE OR REPLACE TABLE dim_date AS
WITH RECURSIVE dates(d) AS (
  SELECT DATE '2025-12-01'
  UNION ALL
  SELECT d + INTERVAL 1 DAY
  FROM dates
  WHERE d < DATE '2026-12-31'
)
SELECT d AS date_val, date_trunc('month', d) as month_val
FROM dates;

-- Base Accounts with Months
CREATE OR REPLACE TABLE base_account_months AS
SELECT 
    a.account_id,
    a.borrower_id,
    a.loan_type,
    a.principal_amount,
    a.outstanding_amount,
    a.dpd,
    a.risk_segment,
    d.month_val
FROM stg_accounts a
CROSS JOIN (SELECT DISTINCT month_val FROM dim_date) d;

-- Aggregate Touchpoints by Month
CREATE OR REPLACE TABLE agg_touchpoints AS
SELECT 
    account_id,
    date_trunc('month', CAST(touchpoint_time AS TIMESTAMP)) as month_val,
    count(*) as total_touchpoints,
    sum(case when channel='call' then 1 else 0 end) as call_attempts,
    sum(case when channel='sms' then 1 else 0 end) as sms_attempts,
    sum(case when channel='whatsapp' then 1 else 0 end) as whatsapp_attempts
FROM fct_touchpoints
GROUP BY 1, 2;

-- Aggregate Payments by Month (Unique/Legitimate only)
CREATE OR REPLACE TABLE agg_payments AS
SELECT 
    account_id,
    date_trunc('month', CAST(event_at AS TIMESTAMP)) as month_val,
    sum(amount) as total_recovered,
    count(payment_id) as total_payments
FROM fct_payments
GROUP BY 1, 2;

-- Build Golden Dataset
CREATE OR REPLACE TABLE golden_dataset AS
SELECT 
    b.*,
    COALESCE(t.total_touchpoints, 0) as total_touchpoints,
    COALESCE(t.call_attempts, 0) as call_attempts,
    COALESCE(t.sms_attempts, 0) as sms_attempts,
    COALESCE(t.whatsapp_attempts, 0) as whatsapp_attempts,
    COALESCE(p.total_recovered, 0.0) as total_recovered,
    COALESCE(p.total_payments, 0) as total_payments,
    CASE WHEN COALESCE(p.total_recovered, 0) > 0 THEN 1 ELSE 0 END as is_recovered
FROM base_account_months b
LEFT JOIN agg_touchpoints t ON b.account_id = t.account_id AND b.month_val = t.month_val
LEFT JOIN agg_payments p ON b.account_id = p.account_id AND b.month_val = p.month_val;
