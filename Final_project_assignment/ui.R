
library(shiny)
data <- read.csv("heart.data.csv")

ui <- fluidPage(
  titlePanel("Predict Heart Rate Disease from Smoking and Biking"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderSmoking",  "Percentage of People smoking", min = 1, max = 30, value = 10),
      sliderInput("sliderBiking",  "Percentage of People biking to work", min = 1, max = 75, value = 30),
      checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
      checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE)
    ),
    
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted Heart Disease from Model 1:"),
      textOutput("pred1"),
      h3("Predicted Heart Disease from Model 2:"),
      textOutput("pred2"),
      h3("Documentation/ how to use the app"),
      textOutput("explanation1") 
    )
  )
)