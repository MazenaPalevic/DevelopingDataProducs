#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


ui <- fluidPage(
    selectInput("greeting","Select greetings", choices=c("Hi","Hello","Good Evening","Salut","Ahoy","Hahaha")),
    textInput("name","Enter your name"),
    selectInput("compliment", "select compliment", choices =c("you're beutiful", "you're cute", "you make my day better", "you're so smart")),
    textOutput("answer"),
   
    
    # Sidebar layout with input and output definitions ----
    sidebarLayout(
        
        # Sidebar panel for inputs ----
        sidebarPanel(
            
            # Input: Slider for the number of bins ----
            sliderInput(inputId = "bins",
                        label = "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
            
        ),
        
        # Main panel for displaying outputs ----
        mainPanel(
            
            # Output: Histogram ----
            plotOutput(outputId = "distPlot")
            
        )
    )
)



server <- function(input, output, session) {
    output$answer <- renderText ({
        paste(input$greeting, ", ", input$name, ", ", input$compliment, ",", "here's some random interactive graph, hope you like it")})
    
    output$distPlot <- renderPlot  ({
        
        x    <- faithful$waiting
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        hist(x, breaks = bins, col = "red", border = "yellow",
             xlab = "Waiting time to next eruption (in mins)",
             main = "Histogram of waiting times")
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
