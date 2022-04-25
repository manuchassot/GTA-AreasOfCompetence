# Base map
BaseMap = 
  ggplot() +
  geom_sf(data = WORLD_BORDERS_SF, size = .2, fill = "darkgrey", col = NA) +
  theme(panel.grid.major = element_line(color = gray(0.9), linetype = "dashed", size = 0.5))

# ggplot
IOTC_AREAS_GGMAP = 
  BaseMap +
  geom_sf(data = TOTAL_CATCH_AREA_IOTC_SF, fill = "red") +
  geom_sf(data = INTERSECTION_CATCH_IOTC_AREA) +
  scale_x_continuous(limits = c(20, 145)) +
  scale_y_continuous(limits = c(-60, 30)) +
  theme_bw() +
  labs(x = "", y = "")
