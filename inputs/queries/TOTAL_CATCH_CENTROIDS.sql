SELECT DISTINCT geographic_identifier, geom_wkt, unit, 
ST_X(ST_CENTROID(ST_GeomFromText(geom_wkt))) AS LONG_CENTROID, 
ST_Y(ST_CENTROID(ST_GeomFromText(geom_wkt))) AS LAT_CENTROID, 
SUM(value) AS CATCH
FROM fact_tables.global_catch_firms_level0
GROUP BY geographic_identifier, geom_wkt, unit
ORDER BY geographic_identifier, geom_wkt, unit