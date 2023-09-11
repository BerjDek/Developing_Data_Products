
server <- shinyServer(function(input, output) {
  model1 <- lm(heart.disease ~ biking, data = data)
  model2 <- lm(heart.disease ~ biking + smoking, data = data)
  
  model1pred <- reactive({
    BkInput <- input$sliderBiking
    predict(model1, newdata = data.frame(biking = BkInput))
  })
  
  model2pred <- reactive({
    BkInput <- input$sliderBiking
    SmkInput <- input$sliderSmoking
    predict(model2, newdata = data.frame(biking = BkInput, smoking = SmkInput))
  })
  
  output$plot1 <- renderPlot({
    BkInput <- input$sliderBiking
    
    plot(data$biking, data$heart.disease, xlab = "Percentage of People biking to work",
         ylab = "Heart Disease rate", pch = 16, col = "black", 
         main = "Heart Disease Prediction Models",
         xlim = c(0, 100))  # Adjust the x-axis limits
    
    if (input$showModel1) {
      abline(model1, col = "blue", lwd = 2)
    }
    
    if (input$showModel2) {
      points(BkInput, model2pred(), col = "blue", pch = 16, cex = 2)
    }
    
    legend(25, 250, c("Biking Model (Blue Line)", "Smoking and Biking Model (Blue Dot)"), 
           pch = 16, col = c("blue", "blue"), bty = "n", cex = 1.2)
  })
  
  output$pred1 <- renderText({
    pred1_val <- model1pred()
    paste("Predicted Heart Disease (Biking Model):", round(pred1_val, 2))
  })
  
  output$pred2 <- renderText({
    pred2_val <- model2pred()
    paste("Predicted Heart Disease (Smoking and Biking Model):", round(pred2_val, 2))
  })
    
    output$explanation1 <- renderText({
      paste("The plot shows the relationship between biking and heart disease in a population, when considering the percentage of bikers and later smokers in town.
            The blue line represents Model 1, which considers biking as a predictor, the blue dot represents Model 2 Prediction based on the additional information of smoking rates")
    })

})