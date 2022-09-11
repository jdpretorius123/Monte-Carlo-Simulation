source('modules/graphMontePi.R')
source('modules/monteCarloPi.R')
library(shiny)

ui <- fluidPage(
  
  tags$head(
    
    tags$link(
      
      rel = "stylesheet",
      
      type = "text/css",
      
      href = "monteCSS.css"
      
    )
    
  ),
  
  div(
    
    id = "ui",
    
    titlePanel(
      
      div(
        
        id = "title",
        
        "Monte Carlo Simulation for Pi"
        
      ),
      
      windowTitle = "MontePi Simulation"
      
    ),
    
    br(),
    br(),
    
    sidebarLayout(
      
      div(
        
        id = "sidebar",
        
        sidebarPanel(
          
          p(
            
            id = "instructions",
            
            "Please enter a number between 1 and 50000",
            
            span(
              
              id = "range",
              
              "(range is inclusive)."
              
            ),
            
            "This represents the number of trials to 
            simulate. Then, please click ",
            
            span(
              
              id = "inlineRun",
              
              "Run."
              
            ),
            
            "The simulation results will appear shortly."
            
          ),
          
          br(),
          
          numericInput(
            
            inputId = "numTrials",
            
            label = "Number of Trials:",
            
            value = 1000,
            
            min = 1,
            
            max = 50000
            
          ),
          
          actionButton(
            
            inputId = "run",
            
            label = "Run"
          )
        )
      ),
      
      mainPanel(
        
        plotOutput(
          
          outputId = "sim"
          
        ),
        
        br(),
        br(),
        
        textOutput(
          
          outputId = "pi"
          
        )
      )
    )
  )
)

server <- shinyServer(function(input, output){
  
  observeEvent(input$run,{
    set.seed(1)

    n <- input$numTrials
    
    output$sim <- renderPlot(graphMontePi(numDarts = n))
    
    output$pi <- renderText(c("According to the number of trials that you simulated, the approximation for pi is: ", monteCarloPi(numDarts = n)))
    
  })
  
})

shinyApp(ui = ui, server = server)
