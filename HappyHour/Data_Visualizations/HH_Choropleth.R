library(leaflet)
library(dplyr)
library(rgdal)

draw_hh_choropleth <- function(hh_data, country_coord_data, region, factor_choice) {
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
  
  hh_data_modified2 <- left_join(hh_data_modified, country_coord_data, by = "Country")
  
  map_lines <- readOGR("Data_Visualizations/TM_WORLD_BORDERS-0.3/TM_WORLD_BORDERS-0.3.shp")
  
  map_lines2 <- subset(map_lines, is.element(map_lines$CNTRY_NAME, hh_data_modified2$Country))
  
  hh_data_modified3 <- hh_data_modified2[order(match(hh_data_modified2$Country, map_lines2$CNTRY_NAME)),]
  
  # Setting bins for the two different factors #
  alcohol_bin <- c(0, 1, 2, 3, 4, 5, 6, 7)
  happiness_bin <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
  bin_chosen <- 0
  domain_chosen <- 0
  pal_setting <- 0
  if(factor_choice == "Alcohol per Capita") {
    bin_chosen = alcohol_bin
    domain_chosen = hh_data_modified3$Alcohol_PerCapita
  } else if(factor_choice == "Happiness") {
    bin_chosen = happiness_bin
    domain_chosen = hh_data_modified3$HappinessScore
  }
  
  choro_palette <- colorBin("RdYlBu", domain = domain_chosen, bins = bin_chosen)
  
  # ------------ #
  
  
  m <- leaflet() %>% addProviderTiles(providers$Stamen.Toner) %>%
    setView(lng = lng_chosen, lat = lat_chosen, zoom = 2.7) %>%
    addPolygons(data = map_lines,
                color = "white",
                weight = 1,
                smoothFactor = 1,
                fillOpacity = 0.8,
                fillColor = ~choro_palette(domain_chosen),
                ) %>%
  addLegend(pal = choro_palette,
            values = domain_chosen,
            opacity = 0.7,
            position = "topright")
  
  
  return(m)
}


