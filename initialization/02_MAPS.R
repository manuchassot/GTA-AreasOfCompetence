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

### IOTC 

BaseMap +
  geom_sf(data = TOTAL_CATCH_AREA_IOTC_SF, fill = alpha("blue", 0.2)) +
  #  geom_sf(data = IOTC_AREA_FIRMS, fill = alpha("red", .3), color = "red", size = .8) +
  geom_sf(data = GRIDS_NOT_WITHIN_IOTC_AREA_SF, fill = "red") +
  geom_sf(data = IOTC_AREA, fill = NA, size = 1, col = "green") +
    labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(10, 155), ylim = c(-65, 40), expand = FALSE)
