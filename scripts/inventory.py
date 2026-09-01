import os
import glob
import pandas as pd
import numpy as np

RAW_DIR = "data/raw"
OUTPUT_MD = "docs/data_inventory.md"
OUTPUT_CSV = "outputs/tables/data_inventory.csv"

def analyze_csv(filepath):
    print(f"Analyzing {filepath}...")
    try:
        # Load with low_memory=False to avoid mixed type warnings
        df = pd.read_csv(filepath, low_memory=False)
    except Exception as e:
        print(f"Error reading {filepath}: {e}")
        return None

    filename = os.path.basename(filepath)
    num_rows = len(df)
    num_cols = len(df.columns)
    duplicate_rows = df.duplicated().sum()
    
    col_stats = []
    
    for col in df.columns:
        series = df[col]
        dtype = str(series.dtype)
        null_count = series.isnull().sum()
        null_pct = (null_count / num_rows) * 100 if num_rows > 0 else 0
        distinct_count = series.nunique(dropna=True)
        
        # Candidate PK check
        is_candidate_pk = (distinct_count == num_rows) and (null_count == 0) and ("id" in col.lower() or "code" in col.lower())
        
        # Dates check
        min_date = ""
        max_date = ""
        if 'date' in col.lower() or 'time' in col.lower() or 'at' in col.lower().split('_'):
            try:
                # Try parsing as datetime
                dt_series = pd.to_datetime(series, errors='coerce')
                valid_dts = dt_series.dropna()
                if not valid_dts.empty:
                    min_date = str(valid_dts.min())
                    max_date = str(valid_dts.max())
            except:
                pass
                
        # Suspicious values (e.g. negatives in numericals)
        suspicious = ""
        if pd.api.types.is_numeric_dtype(series):
            if series.min() < 0:
                suspicious = f"Has negatives (min: {series.min()})"
                
        col_stats.append({
            "table": filename,
            "column": col,
            "dtype": dtype,
            "num_rows": num_rows,
            "null_count": null_count,
            "null_pct": round(null_pct, 2),
            "distinct_count": distinct_count,
            "is_candidate_pk": is_candidate_pk,
            "min_date": min_date,
            "max_date": max_date,
            "suspicious": suspicious,
            "duplicate_table_rows": duplicate_rows
        })
        
    return col_stats

def main():
    csv_files = glob.glob(os.path.join(RAW_DIR, "*.csv"))
    all_stats = []
    
    for f in csv_files:
        stats = analyze_csv(f)
        if stats:
            all_stats.extend(stats)
            
    if not all_stats:
        print("No stats collected.")
        return
        
    df_stats = pd.DataFrame(all_stats)
    
    # Save to CSV
    os.makedirs(os.path.dirname(OUTPUT_CSV), exist_ok=True)
    df_stats.to_csv(OUTPUT_CSV, index=False)
    print(f"Saved {OUTPUT_CSV}")
    
    # Save to Markdown
    os.makedirs(os.path.dirname(OUTPUT_MD), exist_ok=True)
    with open(OUTPUT_MD, "w") as f:
        f.write("# Data Inventory\n\n")
        
        # Group by table
        tables = df_stats['table'].unique()
        for tbl in tables:
            tbl_df = df_stats[df_stats['table'] == tbl]
            num_rows = tbl_df['num_rows'].iloc[0]
            num_cols = len(tbl_df)
            dup_rows = tbl_df['duplicate_table_rows'].iloc[0]
            
            f.write(f"## {tbl}\n")
            f.write(f"- **Rows**: {num_rows}\n")
            f.write(f"- **Columns**: {num_cols}\n")
            f.write(f"- **Duplicate Rows**: {dup_rows}\n\n")
            
            # Write column table
            cols_to_print = tbl_df[['column', 'dtype', 'null_count', 'null_pct', 'distinct_count', 'is_candidate_pk', 'min_date', 'max_date', 'suspicious']]
            f.write(cols_to_print.to_markdown(index=False))
            f.write("\n\n")
            
    print(f"Saved {OUTPUT_MD}")

if __name__ == "__main__":
    main()
