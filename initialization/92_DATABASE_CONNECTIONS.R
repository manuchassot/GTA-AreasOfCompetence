
print("Initializing connection to the Global Tuna Atlas...")

con_GTA = DBI::dbConnect(
  drv = RPostgreSQL::PostgreSQL(),
  host = "35.242.196.99",
  user = "tunaatlasdb",
  password = "!tunaatlasdb!",
  port = "5432",
  dbname = "tunaatlas"
)

IOTDB_connection = iotc.core.db.connections::DB_IOTDB()

print("GTA connection initialized!")