library(shiny)

shinyServer(function(input, output){
  output$route_barPlot <- renderPlot({
    barplot(df_agg[,input$routetype],
            main=input$routetype,
            ylab = "rides",
            xlab = "year")
  })
})