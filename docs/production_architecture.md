# Production Architecture

## Overview
The collections data pipeline is designed using a Medallion Architecture (Raw -> Staging -> Forensics -> Golden -> Metrics) to ensure reproducibility and data trust.

## Architecture Diagram (Mermaid)

```mermaid
graph TD
    subgraph Sources
        RAW[Raw CSVs / Systems]
    end
    
    subgraph Staging Layer (DuckDB)
        STG[stg_* Tables]
        RAW -->|Ingest & Hash| STG
        STG_NOTE[Removes Exact Row Duplicates]
    end
    
    subgraph Forensics Layer
        ENT[dim_agent]
        DEDUP[fct_payments]
        ATTR[fct_payment_attribution]
        
        STG -->|Type-2 SCD| ENT
        STG -->|Forensic Classification| DEDUP
        STG -->|7-Day Lookback| ATTR
    end
    
    subgraph Golden Layer
        GOLD[golden_dataset]
        ENT --> GOLD
        DEDUP --> GOLD
        ATTR --> GOLD
        GOLD_NOTE[Grain: Account-Month]
    end
    
    subgraph Metrics & Serving
        MET[independent_metrics vs reported_metrics]
        GOLD --> MET
        MET --> DASH[Executive Dashboard]
    end
```

## Engineering Principles
- **Data Contracts**: DuckDB enforces strict typing on read. The pipeline fails if schema shifts occur.
- **Deduplication Strategy**: We do not blindly drop payments. They are classified into `true_duplicate`, `legitimate`, and `retry`, and we only drop `retry` to prevent inflation while maintaining auditability.
- **Automated Tests**: Pytest is used to assert Primary Key / Foreign Key constraints, no join explosions, and zero negative payments.

## Deployment
Can be deployed via Airflow/Dagster orchestrating `scripts/pipeline.py` daily, outputting to a persistent data warehouse (e.g. Snowflake/BigQuery) instead of local DuckDB.
