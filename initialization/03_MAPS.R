# Set black and white theme by default
theme_set(theme_bw())

# Base map
BaseMap = 
  ggplot() +
  geom_sf(data = WORLD_BORDERS_SF, size = .2, fill = "darkgrey", col = NA) +
  theme(panel.grid.major = element_line(color = gray(0.9), linetype = "dashed", size = 0.5))

# Indian Ocean large area maps ####
IOTC_AREAS_COL = c("#BDD7E7", "#6BAED6")

IOTC_AREAS_NOT_INTERSECTION = 
  BaseMap +
  geom_sf(data = IOTC_AREAS, aes(fill = label), size = .5) +
  scale_fill_manual(values = IOTC_AREAS_COL) + 
  geom_sf(data = GRIDS_WITH_CATCH_NOT_IOTC_AREA_SF, fill = "red") +
  scale_x_continuous(limits = c(20, 145)) +
  scale_y_continuous(limits = c(-60, 30)) +
  theme_bw() +
  labs(x = "", y = "") +
  theme(legend.position = "none", legend.title = element_blank())

