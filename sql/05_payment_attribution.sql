-- 05_payment_attribution.sql
-- Attribute payments to campaigns and channels within a 7-day window.

CREATE OR REPLACE TABLE fct_touchpoints AS
SELECT account_id, event_at as touchpoint_time, 'call' as channel, campaign_id, agent_id
FROM stg_calls
UNION ALL
SELECT account_id, event_at as touchpoint_time, 'sms' as channel, NULL as campaign_id, NULL as agent_id
FROM stg_sms_events
UNION ALL
SELECT account_id, event_at as touchpoint_time, 'whatsapp' as channel, NULL as campaign_id, NULL as agent_id
FROM stg_whatsapp_events;

CREATE OR REPLACE TABLE fct_payment_attribution AS
WITH payment_touchpoints AS (
    SELECT 
        p.payment_id,
        p.account_id,
        p.amount,
        p.event_at as payment_time,
        t.touchpoint_time,
        t.channel,
        t.campaign_id,
        t.agent_id,
        epoch(CAST(p.event_at AS TIMESTAMP)) - epoch(CAST(t.touchpoint_time AS TIMESTAMP)) as seconds_since_touchpoint
    FROM fct_payments p
    LEFT JOIN fct_touchpoints t 
        ON p.account_id = t.account_id 
        AND t.touchpoint_time <= p.event_at
        AND epoch(CAST(p.event_at AS TIMESTAMP)) - epoch(CAST(t.touchpoint_time AS TIMESTAMP)) <= 7 * 24 * 3600 -- 7 day window
),
ranked_attribution AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY payment_id ORDER BY seconds_since_touchpoint ASC) as rn
    FROM payment_touchpoints
)
SELECT * FROM ranked_attribution WHERE rn = 1;
