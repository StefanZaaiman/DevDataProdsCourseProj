library(shiny)
library(datasets)
names(mtcars) = c("mpg", "cyl", "Displacement", "hp", "drat", "Weight", "Quartermile Time", "vs", "am", "gear", "carb")

shinyServer(function(input, output) {

  finalDataframe = reactive({
    mtcars[,c(input$predvar,"mpg")]
    })

#  regression = reactive({
#    lm(mtcars$mpg, mtcars[,input$predvar])
#  })

  output$plot1 = renderPlot({
  #  par(mar = c(5.1, 4.1, 0, 1))
    plot(finalDataframe(), 
          main = "Linear regression on MPG", 
          ylab = "Miles Per Gallon", 
          xlab = colnames(finalDataframe()[1]))
    abline(lm(finalDataframe()[,c(2)] ~ finalDataframe()[,c(1)]))
  })
})