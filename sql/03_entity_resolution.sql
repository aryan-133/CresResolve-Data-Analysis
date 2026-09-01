-- 03_entity_resolution.sql

-- Resolve agents: Pick the most recently updated record for each agent_id to represent their current state
CREATE OR REPLACE TABLE dim_agent AS
WITH ranked_agents AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY agent_id ORDER BY updated_at DESC, joined_at DESC) as rn
    FROM stg_agents
)
SELECT 
    agent_id,
    employee_code,
    agent_name,
    vendor_id,
    team,
    status,
    joined_at,
    updated_at
FROM ranked_agents
WHERE rn = 1;
