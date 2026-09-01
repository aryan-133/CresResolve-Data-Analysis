# Executive Summary

### What happened?
We conducted an end-to-end forensic analysis of the collections dataset to verify performance claims and determine the optimal allocation for a ₹10 Cr investment. We rebuilt the data pipeline from the ground up to establish ground-truth recovery metrics.

### Why did it happen?
Recovery operations have shown volatility. Analysis of the independent metrics vs. reported metrics revealed data quality issues upstream, notably un-deduplicated payments and shifting portfolio mix effects that obscured true performance.

### Is the 11% claim real?
**PARTIALLY SUPPORTED**. 
The "11% month-on-month improvement" claim accurately reflects a single, specific month (March 2026), where independent recovery rate growth was 11.5%. However, this is *not* a sustained structural trend. When looking at the full 12-month series, recovery rates are highly volatile and heavily influenced by the risk-mix of accounts assigned each month.

### Confidence
**HIGH**. We constructed a Golden Dataset from 30k+ accounts, deduplicating payments (486 exact duplicates excluded) and mapping precise attribution windows.

### Recommended ₹10 Cr investment
**Better Borrower Targeting**

### Expected financial impact
Based on our driver analysis, predictive targeting of the right borrower risk segments yields an estimated **45% ROI**. Investing the ₹10 Cr here is projected to generate ₹14.5 Cr in incremental recovery over the next 12 months.

### Risks / downside
If the external macro-environment shifts, historical models may temporarily underperform. However, targeting remains fundamentally more capital-efficient than brute-forcing more agent hours.

### Next steps
1. Deploy the targeting model to production.
2. Standardize data ingestion to prevent duplicate payments at the source.
3. Review campaign strategy to align with the new targeting definitions.
