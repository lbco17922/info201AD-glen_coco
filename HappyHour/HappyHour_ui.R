library(shiny)
library(plotly)
library(leaflet)
library(ggplot2)

HappyHour_ui <- fluidPage(
  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "HappyHourStyle.css")
  ),
  
  titlePanel(
    h1("Happy Hour: A Glimpse at the Relationship Between Alcohol Consumption and Happiness Worldwide")
  ),
  
  # Main Panel
  mainPanel(
    tabsetPanel(
      # ----- Tab panel for general summary: -----
      tabPanel("Summary and Motivation",
        navbarPage(title="",
           tabPanel(
             "Project Overview",
             tags$div(
               class = "bodytext",
                "The goal of this project is to determine whether or not a relationship exists with happiness
                worldwide, and the consumption of alcoholic beverages.  Our group wishes to find out if alcohol
                actually is the cause of an improvement in mood, or if it causes the opposite, or if it is just
                completely unrelated altogether. Our research will provide a surface level insight for relevant 
                parties (such as alcohol producing companies, breweries, retailers, and governments, for example)
                to take into consideration when making their business decisions/policies. The results of this 
                project can be used as a reference for these parties to regulate alcohol sales for the benefit 
                of the public or even whether or not it would be successful in various countries."
             )
           ),
          tabPanel(
            "Context",
            tags$div(
              class = "bodytext",
              h4("Is there a Problem?:"),
              tags$br(),
              "Alcohol can often be seen as the source of depression and other mental illnesses, yet, many rely 
              on its effects to relieve stress and bring themselves joy. As such, our group aims to understand
              the unique relationship between happiness levels and alcohol consumption by studying the “happiness”
              data collected throughout various countries as well as the access they have to alcohol.
              Problem Situation: The primary stakeholders for our project would most likely be current or potential
              consumers of alcohol as they can utilize our data to make decisions on whether or not frequent/excessive
              alcohol consumption will help their moods in the long run. A possible secondary stakeholder may be 
              governments deciding how to regulate alcohol sales within their respective countries. A final possible
              secondary stakeholder may be alcohol companies seeing where their businesses would perform the most
              effectively.", 
              tags$br(), 
              h4("Why does it matter?:"), 
              tags$br(), 
              "Leading back to the problem statement, this matters because our group wishes to find out if alcohol 
              actually is the cause of an improvement in mood. Our research will provide basic evidence for alcohol
              companies and governments in their decisions on how to regulate alcohol sales for the benefit of the
              public or even whether or not it would be successful in various countries."
            )
          ),
          tabPanel(
            "Affiliation",
            tags$div(
              class = "bodytext",
              "INFO-201A: Technical Foundations of Informatics,", 
              tags$br(), 
              " The Information School,", 
              tags$br(), 
              " University of Washington,", 
              tags$br(), 
              " Autumn 2019. "
            )
          ),
          tabPanel(
            "Reflection",
            tags$div(
              class = "bodytext",
              "Sara: this data set was interesting to analyze because this topic is so controversial, and I 
              did not know that there were so many other factors that need to be analyzed to understand this topic
              fully. I also think that designing this into a map will be interesting and appealing because it will
              be more user interactive. It was a little frustrating getting the appendix 1 chart onto GitHub, other
              than that everything was done well. This project has helped me develop my identity as a thinker because
              I now know more methods on analyzing data, and know more innovative ways to present data on a certain 
              subject- especially using different charts and visualizations. Also in the future for my other projects
              or professional work, I will be using different data sets to research a problem because then it gives 
              better accurate results."
            )
          )
        )
      ),
      
      
      # ----- Tab panel for the Bar Plot Visual-----
      tabPanel(
        "Scatter Plot Visualization",
        mainPanel(
          position = "right",
          plotlyOutput("general_scatter")
        ),
        sidebarLayout(
          position = "left",
          sidebarPanel(
            uiOutput("scatter_ui")
          ),
          mainPanel()
        )
      ),
      
      # ----- Tab panel for the Choropleth Visual -----
      tabPanel(
        "World Map Visualization",
        mainPanel(
          position = "right",
          leafletOutput("general_choropleth")
        ),
        sidebarLayout(
          position = "left",
          sidebarPanel(
            uiOutput("choropleth_ui_region"),
            uiOutput("choropleth_ui_data")
          ),
          mainPanel()
        )
      ),
      # ----- Tab panel for the conclusions on data -----
      tabPanel(
        "Conclusions",
        includeMarkdown("conclusion.md")
      ),
      
      # ----- Tab panel for the resources on data -----
      tabPanel(
        "Resources", 
        tags$div(
          "References:",
          tags$br(),
          "Link to Choropleth map image: https://gisgeography.com/choropleth-maps-data-classification/",
          tags$br(),
          "Link to Bar Graph image: https://en.wikipedia.org/wiki/File:Truncated_Bar_Graph.svg",
          tags$br(),
          "Data Set 1 Link: https://www.kaggle.com/marcospessotto/happiness-and-alcohol-consumption?fbclid=IwAR1m6_iknYXQGdBuRtb7G045el3rqqG3vXUjtRrya1EH_D-WxDiHxU0yBy0",
          tags$br(),
          "Data Set 2 Link: https://www.kaggle.com/fivethirtyeight/fivethirtyeight-alcohol-consumption-dataset"
        )
      )
    )
  )
)



