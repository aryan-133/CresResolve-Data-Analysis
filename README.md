# Collections Analysis Project

An end-to-end forensic analysis of a collections dataset, aimed at verifying a claimed 11% month-on-month improvement in recovery rates and recommending a ₹10 Cr investment strategy.

## Approach
This project establishes a rigorous "truth layer" through a dimensional modeling approach using **DuckDB** and **Python**:
1. **Data Inventory**: Computed shapes and missingness.
2. **Staging & Forensics**: Deduplicated exact rows, identified 486 duplicate payments, and applied Type-2 entity resolution on Agents.
3. **Attribution**: Built a strict 7-day lookback attribution model to link payments to multi-channel touchpoints.
4. **Golden Dataset**: Aggregated event data up to the `account-month` grain to avoid join explosions and prevent Simpson's Paradox biases.

## Key Findings
- **The 11% Claim**: **Partially Supported**. The reported 11% growth was observed independently only for a single month (March 2026 at 11.5%). It is not a sustained structural trend, as subsequent months showed volatility and decline due to shifting portfolio risk mixes.
- **Investment Recommendation**: **Better Borrower Targeting**. Driver analysis indicates targeting precision has the highest expected ROI (45%), as recovery is highly sensitive to the underlying risk profile assigned to the agents.

## Architecture
```text
Raw Sources (CSV)
       ↓
Staging Layer (DuckDB) -> Deduplication
       ↓
Forensic Clean Layer -> Entity Resolution
       ↓
Attribution Layer -> 7-Day Window
       ↓
Golden Dataset (Account-Month Grain)
       ↓
Metrics & Dashboards
```

## Reproduction Instructions
1. Unzip the dataset into `data/raw/`
2. Install dependencies: `pip install duckdb pandas numpy streamlit plotly tabulate pytest`
3. Run the pipeline: `python scripts/pipeline.py`
4. Run DQ tests: `pytest scripts/dq_tests.py`
5. Generate Analysis: `python scripts/analysis.py`
6. Start Dashboard: `streamlit run dashboard/app.py`
