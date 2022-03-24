# Set black and white theme by default
theme_set(theme_bw())

# Global map
world_map = ne_countries(scale = "small", returnclass = c("sf"))

# Base map
BaseMap = 
  ggplot() +
  geom_sf(data = world_map, size = .2, fill = "darkgrey", col = NA) +
  theme(panel.grid.major = element_line(color = gray(0.9), linetype = "dashed", size = 0.5)) +
  theme(panel.border = element_rect(size = 1.5, linetype = "solid"))

# Turn off the s2 processing
#sf::sf_use_s2(FALSE)

BaseMap +
  geom_sf(data = IOTC_AREA_WIO, fill = NA) +
  geom_sf(data = IOTC_AREA_EIO, fill = NA) +
#  geom_sf(data = IOTC_AREA_FIRMS, fill = alpha("red", .3), color = NA) +
#  geom_sf(data = GRIDS_NOT_WITHIN_IOTC_AREA_SF, fill = "red") +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(10, 155), ylim = c(-65, 40), expand = FALSE)
