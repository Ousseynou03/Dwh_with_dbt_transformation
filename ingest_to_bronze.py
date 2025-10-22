import pandas as pd
from sqlalchemy import create_engine

# --- Connexion PostgreSQL ---
pg_user = "postgres"
pg_password = "postgres"
pg_host = "localhost"
pg_port = "5434"
pg_db = "postgres"

engine = create_engine(
    f"postgresql+psycopg2://{pg_user}:{pg_password}@{pg_host}:{pg_port}/{pg_db}"
)

# --- Liste des fichiers sources ---
csv_files = {
    "bronze.customers": "data/customers.csv",
    "bronze.products": "data/products.csv",
    "bronze.orders": "data/orders.csv"
}

# --- Ingestion dans PostgreSQL ---
for table, path in csv_files.items():
    print(f"📥 Chargement de {path} vers {table} ...")
    df = pd.read_csv(path)
    schema, table_name = table.split(".")
    df.to_sql(table_name, con=engine, schema=schema, if_exists="replace", index=False)
    print(f"✅ Table {table} chargée ({len(df)} lignes).")

print("\n🚀 Ingestion terminée ! Les données sont dans la couche bronze.")
