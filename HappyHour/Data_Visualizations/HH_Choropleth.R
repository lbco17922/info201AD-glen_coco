library(leaflet)
library(dplyr)
library(rgdal)

draw_hh_choropleth <- function(hh_data, region, factor_choice) {
  # Code to set appropriate coordinates for viewing purposes #
  lng_chosen = 0
  lat_chosen = 0
  if(region == "Australia and New Zealand") {
    lng_chosen = 144.2
    lat_chosen = -28.65
  } else if(region == "Central and Eastern Europe") {
    lng_chosen = 0.184873
    lat_chosen = 51.57562
  } else if(region == "Eastern Asia") {
    lng_chosen = 120.766063
    lat_chosen = 9.458196
  } else if(region == "Latin American and Caribbean") {
    lng_chosen = -84.999604
    lat_chosen = 18.393694
  } else if(region == "Middle East and Northern Africa") {
    lng_chosen = 29.995368
    lat_chosen = 31.268205
  } else if(region == "North America") {
    lng_chosen = -105.2551
    lat_chosen = 54.5260
  } else if(region == "Southeastern Asia") {
    lng_chosen = 115.6628
    lat_chosen = -2.2180
  } else if(region == "Sub-Saharan Africa") {
    lng_chosen = 11.288452
    lat_chosen = 23.806078
  } else if(region == "Western Europe") {
    lng_chosen = 1.2644
    lat_chosen = 46.2022
  }

  # ------------ #

  hh_data_modified <- hh_data %>%
    mutate(Alcohol_PerCapita = 
             (Beer_PerCapita + Spirit_PerCapita + Wine_PerCapita)/100) %>%
    select(Country, Region, HappinessScore, Alcohol_PerCapita) %>%
    arrange(Region)
  
  map_lines <- readOGR("Data_Visualizations/TM_WORLD_BORDERS-0.3/TM_WORLD_BORDERS-0.3.shp")
  
  m <- leaflet() %>%
    addProviderTiles(providers$Stamen.Toner) %>%
    setView(lng = lng_chosen, lat = lat_chosen, zoom = 2) %>%
    addPolygons(data = map_lines)
  
  return(m)
}


