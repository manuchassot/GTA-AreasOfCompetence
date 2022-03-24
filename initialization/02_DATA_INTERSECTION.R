

TOTAL_CATCH_CENTROIDS_IOTC = data.table(TOTAL_CATCH_CENTROIDS)[source_authority == "IOTC"]

TOTAL_CATCH_AREA_IOTC = data.table(TOTAL_CATCH_AREA)[source_authority == "IOTC"]

toto = st_intersects(filter(TOTAL_CATCH_AREA_SF, source_authority == "IOTC"), IOTC_AREA, sparse = FALSE)

GRIDS_NOT_WITHIN_IOTC_AREA = TOTAL_CATCH_AREA_IOTC[!toto[, 1], ]
GRIDS_NOT_WITHIN_IOTC_AREA_SF = st_as_sf(GRIDS_NOT_WITHIN_IOTC_AREA, wkt = "geom_wkt", crs = 4326)
