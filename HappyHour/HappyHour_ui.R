library(shiny)
library(plotly)

HappyHour_ui <- fluidPage(
  titlePanel("Relationship Between Alcohol Consumption and Happiness"),
    
  # Main Panel
  mainPanel(
    navbarPage("The Navbar",
        # ----- Tab panel for general summary: -----
        tabPanel("Summary",
               titlePanel("Summary of the Project"),
               tags$div(
                 "What is the Problem?:", tags$br(),
                 "Alcohol can often be seen as the source of depression and other mental illnesses, yet, many rely on its effects to relieve stress and bring themselves joy. As such, our group aims to understand the unique relationship between happiness levels and alcohol consumption by studying the “happiness” data collected throughout various countries as well as the access they have to alcohol.
                 Problem Situation: The primary stakeholders for our project would most likely be current or potential consumers of alcohol as they can utilize our data to make decisions on whether or not frequent/excessive alcohol consumption will help their moods in the long run. A possible secondary stakeholder may be governments deciding how to regulate alcohol sales within their respective countries. A final possible secondary stakeholder may be alcohol companies seeing where their businesses would perform the most effectively.
                 Why does it matter?: Leading back to the problem statement, this matters because our group wishes to find out if alcohol actually is the cause of an improvement in mood. Our research will provide basic evidence for alcohol companies and governments in their decisions on how to regulate alcohol sales for the benefit of the public or even whether or not it would be successful in various countries."
                       )
        ),
        
        
        # ----- Tab panel for the Bar Plot Visual-----
        tabPanel("Scatter Plot Visual",
                 mainPanel(position = "right",
                   plotlyOutput("general_scatter")
                 ),
                 sidebarLayout(position = "left",
                   sidebarPanel(
                     uiOutput("scatter_ui")
                   ),
                   mainPanel()
                 )
        ),
        
        # ----- Tab panel for the Choropleth Visual -----
        tabPanel("Choropleth Visual",
                 mainPanel(position = "right",
                           leafletOutput("general_choropleth")
                           ),
                 sidebarLayout(position = "left",
                               sidebarPanel(
                                 uiOutput("choropleth_ui_region"),
                                 uiOutput("choropleth_ui_data")
                               ),
                               mainPanel()
                    )
          ),
        # ----- Tab panel for the conclusions on data -----
        tabPanel("Conclusions")
    )
  )
)


