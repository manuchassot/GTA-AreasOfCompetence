# Intersection of area with catch with IOTC area of competence
INTERSECTION_CATCH_IOTC_AREA = st_intersection(TOTAL_CATCH_AREA_IOTC_SF, IOTC_AREA)

# Difference of area with catch with IOTC area of competence
DIFFERENCE_CATCH_IOTC_AREA = st_difference(TOTAL_CATCH_AREA_IOTC_SF, IOTC_AREA)

# Intersects areas with catch with IOTC area of competence
INDIC_INTERSECT_CATCH_IOTC_AREA = st_intersects(TOTAL_CATCH_AREA_IOTC_SF, IOTC_AREA, sparse = FALSE)
GRIDS_NOT_WITHIN_IOTC_AREA = TOTAL_CATCH_AREA_IOTC[!INDIC_INTERSECT_CATCH_IOTC_AREA[, 1], ]
GRIDS_NOT_WITHIN_IOTC_AREA_SF = st_as_sf(GRIDS_NOT_WITHIN_IOTC_AREA, wkt = "geom_wkt", crs = 4326)

# Difference between areas with catch with IOTC area of competence
#DIFERENCE_IOTC_AREA_CATCH_IOTC_AREA = st_difference(TOTAL_CATCH_AREA_IOTC_SF, IOTC_AREA)


GRIDS_NOT_WITHIN_IOTC_AREA = TOTAL_CATCH_AREA_IOTC[INDIC_DISJOINT_CATCH_IOTC_AREA[, 1], ]
GRIDS_NOT_WITHIN_IOTC_AREA_SF = st_as_sf(GRIDS_NOT_WITHIN_IOTC_AREA, wkt = "geom_wkt", crs = 4326)




