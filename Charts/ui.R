

library(shiny)


fluidPage(

  
    titlePanel("Random Charts"),
    sidebarLayout(
        sidebarPanel(
            numericInput("numeric","How Many Random Dots Should Be Plotted?",
                        value = 1000, min = 1, max = 1000, step = 1),
            sliderInput("sliderX", "Pick minimum and maximum X Values",
                        -100, 100, value = c(-50,50)),
            sliderInput("sliderY", "Pick minimum and maximum Y values",
                        -100, 100, value = c(-50,50)),
            checkboxInput("show_xlab", "Show/Hide X Axis Label", value = TRUE),
            checkboxInput("show_ylab", "Show/Hide Y Axis Label", value = TRUE),
            checkboxInput("show_title", "Show/Hide Title"),
        ),

        mainPanel(
            h3("Graph of Random Points"),
            plotOutput("plot1")
        )
    )
)
