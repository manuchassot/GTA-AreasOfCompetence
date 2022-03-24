print("Initializing data extraction...")

# TRFMO AREAS #### 

IOTC  = sf::st_read("../inputs/data/RFB_IOTC.shp")
ICCAT = sf::st_read("../inputs/data/RFB_IATTC.shp")
WCPFC = sf::st_read("../inputs/data/RFB_WCPFC.shp")
CCSBT = sf::st_read("../inputs/data/RFB_CCSBT.shp")
IATTC = sf::st_read("../inputs/data/RFB_IATTC.shp")

# Global 5x5 catches
QUERY_TOTAL_CATCH_AREA = read_file("../inputs/queries/TOTAL_CATCH_AREA.sql")
TOTAL_CATCH_AREA       = dbGetQuery(con_GTA, QUERY_TOTAL_CATCH_AREA)

TOTAL_CATCH_AREA_SF = st_as_sf(TOTAL_CATCH_AREA, wkt = "geom_wkt")
st_crs(TOTAL_CATCH_AREA_SF) = st_crs(IOTC)

QUERY_TOTAL_CATCH_CENTROIDS = read_file("../inputs/queries/TOTAL_CATCH_CENTROIDS.sql")
TOTAL_CATCH_CENTROIDS       = dbGetQuery(con_GTA, QUERY_TOTAL_CATCH_CENTROIDS)

TOTAL_CATCH_CENTROIDS_SF = st_as_sf(TOTAL_CATCH_CENTROIDS, coords = c("long_centroid", "lat_centroid"))
st_crs(TOTAL_CATCH_CENTROIDS_SF) = st_crs(IOTC)

toto = st_intersects(TOTAL_CATCH_CENTROIDS_SF, IOTC)

print("Data extracted!")