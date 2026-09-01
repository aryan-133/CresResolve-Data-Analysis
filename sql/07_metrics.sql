-- 07_metrics.sql

-- Reported metrics (naive: sum everything up, ignoring deduplication and true attribution)
CREATE OR REPLACE TABLE reported_metrics AS
SELECT 
    date_trunc('month', CAST(event_at AS TIMESTAMP)) as month_val,
    count(payment_id) as total_payments,
    sum(amount) as total_recovery
FROM stg_payments
GROUP BY 1;

-- Independent metrics (using the Golden Dataset, ensuring proper denominators)
CREATE OR REPLACE TABLE independent_metrics AS
SELECT 
    month_val,
    count(DISTINCT account_id) as total_accounts,
    sum(case when is_recovered = 1 then 1 else 0 end) as paying_accounts,
    sum(total_recovered) as total_recovery,
    sum(total_payments) as valid_payments,
    
    -- Rates
    case when count(DISTINCT account_id) > 0 then 
        CAST(sum(case when is_recovered = 1 then 1 else 0 end) AS FLOAT) / count(DISTINCT account_id) 
    else 0 end as account_recovery_rate,
    
    case when count(DISTINCT account_id) > 0 then 
        sum(total_recovered) / count(DISTINCT account_id) 
    else 0 end as recovery_per_account

FROM golden_dataset
GROUP BY 1;

-- 11% Claim Verification Table
CREATE OR REPLACE TABLE metrics_comparison AS
SELECT 
    i.month_val,
    r.total_recovery as reported_recovery,
    i.total_recovery as independent_recovery,
    
    -- MoM calculations
    r.total_recovery / LAG(r.total_recovery) OVER (ORDER BY i.month_val) - 1 as reported_mom_growth,
    i.total_recovery / LAG(i.total_recovery) OVER (ORDER BY i.month_val) - 1 as independent_mom_growth
    
FROM independent_metrics i
LEFT JOIN reported_metrics r ON i.month_val = r.month_val
ORDER BY i.month_val;
