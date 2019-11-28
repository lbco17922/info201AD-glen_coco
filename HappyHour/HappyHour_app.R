library(shiny)
# setwd("~/lionel_info201hw01/info201AD-glen_coco/HappyHour")
source("HappyHour_ui.R")
source("HappyHour_server.R")

shinyApp(ui = HappyHour_ui, server = HappyHour_server)