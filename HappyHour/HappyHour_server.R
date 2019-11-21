library(shiny)
library(plotly)
library(leaflet)
source("Data_Visualizations/HH_Scatter.R")
source("Data_Visualizations/HH_Choropleth.R")

HappyHour_server <- function(input, output) {
  hh_data <- read.csv("data/HappinessAlcoholConsumption.csv", stringsAsFactors = FALSE)
  country_coord_data <- read.csv("data/countries.csv", stringsAsFactors = FALSE)
  scatter_choices <- unique(select(hh_data, Region))
  
  output$scatter_ui <- renderUI({
    selectInput(
      inputId = "region_choice",
      label = "Please choose the region you are interested in.",
      choices = as.list(scatter_choices)
    )
  })
  
  output$general_scatter <- renderPlotly({
    draw_hh_scatter(hh_data, input$region_choice)
  })
  
  output$choropleth_ui_region <- renderUI({
    selectInput(
      inputId = "region_choice_2",
      label = "Please choose the region you are intrested in.",
      choices = as.list(scatter_choices)
    )
  })
  
  output$choropleth_ui_data <- renderUI({
    selectInput(
      inputId = "data_choice",
      label = "Please choose the factor you are interested in.",
      choices = as.list(c("Alcohol per Capita", "Happiness"))
    )
  })
  
  output$general_choropleth <- renderLeaflet({
    draw_hh_choropleth(hh_data, country_coord_data, input$region_choice_2, input$data_choice)
  })
}

