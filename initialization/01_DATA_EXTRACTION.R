print("Initializing data extraction...")

# TRFMO AREAS #### 

QUERY_TRFMOS_AREAS = read_file("../inputs/queries/FIRMS_TRMOS_AREAS_OF_COMPETENCE.sql")
TRFMOS_AREAS = dbGetQuery(con_GTA, QUERY_TRFMOS_AREAS)
TRFMOS_AREAS_SF = st_as_sf(TRFMOS_AREAS, wkt = "geom_wkt", crs = 4326)

# Extract each RFMO FIRMS area
IOTC_AREA_FIRMS = TRFMOS_AREAS_SF %>% filter(code == "IOTC")
CCSBT_AREA_FIRMS = TRFMOS_AREAS_SF %>% filter(code == "CCSBT")

# IOTC area (official)
#IOTC_AREA   = iotc.core.gis.wkt::sf_by_code(fishing_ground_codes = "IRALLIO") # TO BE CORRECTED
IOTC_AREAS_WKT = dbGetQuery(con_GTA, "SELECT code, label, code_cwp, st_asText(geom) AS geom_wkt FROM area.areas_task1_iotc;")
IOTC_AREAS     = st_make_valid(st_as_sf(IOTC_AREAS_WKT, wkt = "geom_wkt", crs = 4326))
IOTC_AREA  = st_union(IOTC_AREAS)

# Global catches
QUERY_TOTAL_CATCH_AREA = read_file("../inputs/queries/GTA_TOTAL_CATCH_AREA.sql")
TOTAL_CATCH_AREA       = dbGetQuery(con_GTA, QUERY_TOTAL_CATCH_AREA)
TOTAL_CATCH_AREA_SF    = st_as_sf(TOTAL_CATCH_AREA, wkt = "geom_wkt", crs = 4326)

TOTAL_CATCH_AREA_IOTC = data.table(TOTAL_CATCH_AREA)[source_authority == "IOTC"]
TOTAL_CATCH_AREA_CCSBT = data.table(TOTAL_CATCH_AREA)[source_authority == "CCSBT"]
TOTAL_CATCH_AREA_ICCAT = data.table(TOTAL_CATCH_AREA)[source_authority == "ICCAT"]
TOTAL_CATCH_AREA_WCPFC = data.table(TOTAL_CATCH_AREA)[source_authority == "WCPFC"]
TOTAL_CATCH_AREA_IATTC = data.table(TOTAL_CATCH_AREA)[source_authority == "IATTC"]

TOTAL_CATCH_AREA_IOTC_SF = TOTAL_CATCH_AREA_SF %>% filter(source_authority == "IOTC")
TOTAL_CATCH_AREA_CCSBT_SF = TOTAL_CATCH_AREA_SF %>% filter(source_authority == "CCSBT")
TOTAL_CATCH_AREA_IOTC_SF = TOTAL_CATCH_AREA_SF %>% filter(source_authority == "ICCAT")
TOTAL_CATCH_AREA_WCPFC_SF = TOTAL_CATCH_AREA_SF %>% filter(source_authority == "WCPFC")
TOTAL_CATCH_AREA_IATTC_SF = TOTAL_CATCH_AREA_SF %>% filter(source_authority == "IATTC")

print("Data extracted!")