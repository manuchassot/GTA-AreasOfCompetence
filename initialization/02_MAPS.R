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

# Longhurst provinces
# https://rstudio-pubs-static.s3.amazonaws.com/485396_7d5f60e87225469fb0c0c04684a0cf31.html
LONGHURST_RAW = read_sf("../inputs/shapes/Longhurst_world_v4_2010.shp")

# Turn off the s2 processing
sf::sf_use_s2(FALSE)

LONGHURST = LONGHURST_RAW %>% 
  sf::st_simplify(dTolerance = 0.01) %>% 
  dplyr::group_by(ProvCode, ProvDescr) %>% 
  dplyr::summarise()

BaseMap +
  geom_sf(data = LONGHURST, fill = NA) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(-180, 180), ylim = c(-90, 90), expand = FALSE) +
  geom_scatterpie(aes(x = longitude, y = latitude, group = geographic_identifier, r = TOT/10000), cols = c("ALB", "BET", "YFT", "SWO", "BUM", "MLS"), data = CA_LL_CWP55_TABLE, color = "black", alpha = 0.7, legend_name = "Species")
