
library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Chicago Transit Ridership"),
  sidebarPanel(
    selectInput("route", "Choose a route",
                choices = df_agg$route)
  ),
  mainPanel(
   plotOutput("route_bar") 
  )
))