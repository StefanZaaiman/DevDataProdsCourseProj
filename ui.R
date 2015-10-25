library(shiny)
library(datasets)

shinyUI(fluidPage(
  titlePanel("Linear regression on the mtcars dataset"),
  
  sidebarLayout(
    sidebarPanel(

      helpText("Select a predictor variable for the simple linear 
        regression against miles per gallon (MPG) below:"),

      selectInput("predvar", 
        label = "Choose a predictor variable:",
        choices = c("Displacement", "Weight", "Quartermile Time"), 
        selected = "Displacement")

    ),
  
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("plot1")),
        tabPanel("Documentation", 
          p("This program is quite simple. It takes the built-in 
            R mtcars dataset and runs some simple linear regressions 
            based on a predictor variable selected by the user."),
          p("The user can select any of 3 variables from the mtcars 
            dataset: displacement, weight and quarter 
            mile time."),
          p("The app then automatically conducts a linear 
            regression of this selected variable as the predictor 
            variable against mile per gallon as the response variable."),
          p("The app presents the results of the linear regression as a 
            scatterplot of the predictor (user-selected) and response 
            (mpg) variables, with the fitted linear regression line 
            also plotted on the graph.")
        )
      )
    )
  )
))