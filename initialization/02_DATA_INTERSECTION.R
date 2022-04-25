# Intersection of area with catch with IOTC area of competence
INTERSECTION_CATCH_IOTC_AREA = st_intersection(TOTAL_CATCH_AREA_IOTC_SF, IOTC_AREA)

# Identify grids not in the intersection
GRID_IDS_INTERSECTION = unique(INTERSECTION_CATCH_IOTC_AREA$geographic_identifier)

# Filter for these grids not intersecting with the IOTC area of competence
GRIDS_WITH_CATCH_NOT_IOTC_AREA_SF = TOTAL_CATCH_AREA_IOTC_SF %>% filter(!geographic_identifier %in% GRID_IDS_INTERSECTION)

# Areas with catch purely outside IOTC area of competence
# INDIC_DISJOINT_CATCH_IOTC_AREA = st_disjoint(TOTAL_CATCH_AREA_IOTC_SF, IOTC_AREA, sparse = FALSE)
# GRIDS_DISJOINT_IOTC_AREA = TOTAL_CATCH_AREA_IOTC[INDIC_DISJOINT_CATCH_IOTC_AREA[, 1], ]
# GRIDS_DISJOINT_IOTC_AREA_SF = st_as_sf(GRIDS_DISJOINT_IOTC_AREA, wkt = "geom_wkt", crs = 4326)
# 
# IOTC_AREAS_DISJOINT = 
#   BaseMap +
#   geom_sf(data = IOTC_AREA) +
#   geom_sf(data = GRIDS_DISJOINT_IOTC_AREA_SF, fill = "red") +
#   scale_x_continuous(limits = c(20, 145)) +
#   scale_y_continuous(limits = c(-60, 30)) +
#   theme_bw() +
#   labs(x = "", y = "")
# 
# Difference of area with catch with IOTC area of competence
#DIFFERENCE_CATCH_IOTC_AREA = st_difference(TOTAL_CATCH_AREA_IOTC_SF, IOTC_AREA)

# Intersects areas with catch with IOTC area of competence
#INDIC_INTERSECT_CATCH_IOTC_AREA = st_intersects(TOTAL_CATCH_AREA_IOTC_SF, IOTC_AREA, sparse = FALSE)
#GRIDS_NOT_WITHIN_IOTC_AREA = TOTAL_CATCH_AREA_IOTC[!INDIC_INTERSECT_CATCH_IOTC_AREA[, 1], ]
#GRIDS_NOT_WITHIN_IOTC_AREA_SF = st_as_sf(GRIDS_NOT_WITHIN_IOTC_AREA, wkt = "geom_wkt", crs = 4326)



