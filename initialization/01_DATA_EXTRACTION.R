print("Initializing data extraction...")

# TRFMO AREAS #### 

QUERY_TRFMOS_AREAS = read_file("../inputs/queries/TRMOS_AREAS_OF_COMPETENCE.sql")
TRFMOS_AREAS = dbGetQuery(con_GTA, QUERY_TRFMOS_AREAS)
TRFMOS_AREAS_SF = st_as_sf(TRFMOS_AREAS, wkt = "geom_wkt", crs = 4326)

# Extract IOTC area (FIRMS)
IOTC_AREA_FIRMS = TRFMOS_AREAS_SF %>% filter(code == "IOTC")

# IOTC area (official)
IOTC_AREA = iotc.core.gis.wkt::sf_by_code(fishing_ground_codes = "IRALLIO")
IOTC_AREA_WIO = iotc.core.gis.wkt::sf_by_code(fishing_ground_codes = "IRWESIO")
IOTC_AREA_EIO = iotc.core.gis.wkt::sf_by_code(fishing_ground_codes = "IREASIO")

# Global 5x5 catches
QUERY_TOTAL_CATCH_AREA = read_file("../inputs/queries/TOTAL_CATCH_AREA.sql")
TOTAL_CATCH_AREA       = dbGetQuery(con_GTA, QUERY_TOTAL_CATCH_AREA)
TOTAL_CATCH_AREA_SF = st_as_sf(TOTAL_CATCH_AREA, wkt = "geom_wkt", crs = 4326)

QUERY_TOTAL_CATCH_CENTROIDS = read_file("../inputs/queries/TOTAL_CATCH_CENTROIDS.sql")
TOTAL_CATCH_CENTROIDS       = dbGetQuery(con_GTA, QUERY_TOTAL_CATCH_CENTROIDS)
TOTAL_CATCH_CENTROIDS_SF = st_as_sf(TOTAL_CATCH_CENTROIDS, coords = c("long_centroid", "lat_centroid"), crs = 4326)

print("Data extracted!")