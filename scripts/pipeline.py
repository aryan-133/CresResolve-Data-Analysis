import duckdb
import os

DB_PATH = "data/db/collections.db"

def run_sql_file(con, filepath):
    print(f"Executing {filepath}...")
    with open(filepath, 'r') as f:
        sql = f.read()
    
    # Split by statements if needed, but duckdb con.execute can run multiple statements
    try:
        con.execute(sql)
        print(f"Successfully executed {filepath}")
    except Exception as e:
        print(f"Error executing {filepath}: {e}")
        raise

def main():
    # Ensure DB dir exists
    os.makedirs(os.path.dirname(DB_PATH), exist_ok=True)
    
    # Connect to DuckDB (creates the file if it doesn't exist)
    con = duckdb.connect(DB_PATH)
    
    sql_dir = "sql"
    sql_files = sorted([f for f in os.listdir(sql_dir) if f.endswith('.sql')])
    
    for sql_file in sql_files:
        run_sql_file(con, os.path.join(sql_dir, sql_file))
        
    con.close()
    print("Pipeline execution complete.")

if __name__ == "__main__":
    main()
