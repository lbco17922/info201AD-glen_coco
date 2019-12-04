library(shiny)
source("HappyHour_ui.R")
source("HappyHour_server.R")

shinyApp(ui = HappyHour_ui, server = HappyHour_server)