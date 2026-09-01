# Metric Definitions

To ensure transparency and prevent inflated reporting, we have defined the following independent metrics based strictly on the Golden Dataset (account-month grain).

### 1. Account Recovery Rate
- **Numerator**: Count of distinct `account_id`s with `is_recovered = 1` within the month.
- **Denominator**: Count of distinct `account_id`s active/eligible within that month.
- **Interpretation**: The percentage of assigned accounts that made at least one successful payment.
- **Treatment**: Excludes retries and ingestion duplicates.

### 2. Recovery per Account
- **Numerator**: Sum of `total_recovered` amount.
- **Denominator**: Count of distinct `account_id`s active/eligible.
- **Interpretation**: Average monetary value recovered per assigned account.

### 3. Total Recovery
- **Numerator**: Sum of `total_recovered` across all accounts.
- **Exclusion Rules**: Duplicate payments (detected via same amount, same account, within a short time window) are removed.
- **Attribution**: Based on the 7-day lookback window to the last interaction.

### 4. Touchpoints per Account
- **Numerator**: Sum of `total_touchpoints` (Calls + SMS + WhatsApp).
- **Denominator**: Count of distinct `account_id`s.
- **Interpretation**: Measures the intensity of effort applied to the portfolio.
