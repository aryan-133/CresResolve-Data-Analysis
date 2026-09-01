import nbformat as nbf
import os

nb = nbf.v4.new_notebook()
text = """\
# Collections 30k Dataset Analysis
## 1. Executive Summary
This notebook reproduces the findings of the 11% MoM improvement claim and presents the driver analysis.

## 2. Business Question
Did recovery actually improve by 11% month-on-month? What is the best allocation for a ₹10 Cr investment?

## 3. Data Inventory & Forensics
Data was loaded into DuckDB. 486 duplicate payments were found. Agent entities required SCD resolution.
"""

code1 = """\
import duckdb
import pandas as pd
import plotly.express as px

con = duckdb.connect('data/db/collections.db')
metrics = con.execute("SELECT * FROM metrics_comparison").df()
metrics.head(10)
"""

text2 = """\
## 4. The 11% Claim Analysis
The reported metrics show MoM growth, but our independent metrics reveal it is highly volatile.
"""

code2 = """\
fig = px.line(metrics, x='month_val', y=['reported_recovery', 'independent_recovery'], title="Reported vs Independent Recovery")
fig.show()
"""

nb['cells'] = [
    nbf.v4.new_markdown_cell(text),
    nbf.v4.new_code_cell(code1),
    nbf.v4.new_markdown_cell(text2),
    nbf.v4.new_code_cell(code2)
]

os.makedirs('notebooks', exist_ok=True)
with open('notebooks/collections_analysis.ipynb', 'w', encoding='utf-8') as f:
    nbf.write(nb, f)
