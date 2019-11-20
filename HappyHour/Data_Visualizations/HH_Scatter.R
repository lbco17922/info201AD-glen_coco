library(plotly)
library(dplyr)


draw_hh_scatter <- function(hh_data, region) {
  hh_data_modified <- hh_data %>%
    mutate(Alcohol_PerCapita = 
             (Beer_PerCapita + Spirit_PerCapita + Wine_PerCapita)/100) %>%
    select(Country, Region, HappinessScore, Alcohol_PerCapita) %>%
    arrange(Region)
  
  displayed_data_table <- hh_data_modified %>%
    filter(Region == region)
  
  scatter_plot <- displayed_data_table %>%
    plot_ly(
      type = 'scatter',
      mode = 'markers',
      text = ~Country,
      x = ~Alcohol_PerCapita,
      y = ~HappinessScore
      )
  
  scatter_plot_sized <- scatter_plot %>%
    layout(autosize = F, width = 500, height = 500,
           xaxis = list(range = c(0, 10)),
           yaxis = list(range = c(0, 10)))
    
    
  return(scatter_plot_sized)
}

