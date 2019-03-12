
library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Chicago Transit Ridership"),
  sidebarPanel(
    selectInput("routetype", "Choose a route type",
                choices = df_agg$daytype)
  ),
  mainPanel(
   plotOutput("route_barPlot") 
  )
))