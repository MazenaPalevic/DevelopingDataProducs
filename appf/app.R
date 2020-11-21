library(shiny)


ui <- fluidPage(
    selectInput("greeting","Select greetings", choices=c("Hi","Hello","Good Evening","Salut","Ahoy","Hahaha")),
    textInput("name","Enter your name"),
    selectInput("compliment", "select compliment", choices =c("you're beutiful", "you're cute", "you make my day better", "you're so smart")),
    textOutput("answer"),
        # App title ----
        titlePanel("Hello Shiny!"),
        
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
        paste(input$greeting, ", ", input$name, ", ", input$compliment, ",", "here's some data for you that I calculated")})
        
    output$distPlot <- renderPlot  ({
            
            x    <- faithful$waiting
            bins <- seq(min(x), max(x), length.out = input$bins + 1)
            
            hist(x, breaks = bins, col = "#75AADB", border = "white",
                 xlab = "Waiting time to next eruption (in mins)",
                 main = "Histogram of waiting times")
        
    })
}



