library(shiny)

shinyServer(function(input, output){
  output$route_bar <- renderPlot({
    route_bar <- ggplot(df_agg, aes(year, rides1000)) +
      geom_bar(stat = "identity")
    route_bar
  })
})