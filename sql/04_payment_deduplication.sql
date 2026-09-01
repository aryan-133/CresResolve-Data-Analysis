-- 04_payment_deduplication.sql
-- Classify duplicate payments to understand financial impact

CREATE OR REPLACE TABLE fct_payments_classified AS
WITH ranked_payments AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY account_id, amount, CAST(event_at AS DATE) ORDER BY event_at ASC) as daily_payment_rank,
        LAG(event_at) OVER (PARTITION BY account_id, amount ORDER BY event_at ASC) as prev_event_at
    FROM stg_payments
)
SELECT 
    *,
    CASE 
        WHEN daily_payment_rank > 1 AND epoch(CAST(event_at AS TIMESTAMP)) - epoch(CAST(prev_event_at AS TIMESTAMP)) < 300 THEN 'retry_ingestion_duplicate'
        WHEN daily_payment_rank > 1 THEN 'legitimate_repeated_payment'
        ELSE 'unique_payment'
    END as payment_classification
FROM ranked_payments;

-- Create the clean payment facts (only counting unique and legitimate repeated)
CREATE OR REPLACE TABLE fct_payments AS
SELECT * 
FROM fct_payments_classified
WHERE payment_classification != 'retry_ingestion_duplicate';
