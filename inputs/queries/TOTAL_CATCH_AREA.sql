SELECT DISTINCT geographic_identifier, geom_wkt, unit, SUM(value) AS CATCH
FROM fact_tables.global_catch_firms_level0
GROUP BY geographic_identifier, geom_wkt, unit
ORDER BY geographic_identifier, geom_wkt, unit