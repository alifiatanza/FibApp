ui <- fluidPage(
  titlePanel("Fibonacci"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Print the Fibonacci Number and it's inverse."),
      
      sliderInput("n", label = "Number n for fibonacci:", min = 0, max = 40, value = 5)
    ),
    
    mainPanel(
      textOutput("fib_num"),
      
      textOutput("fib_num_inv")
      
    ) 
  )
)



fib <- function(n){
  ifelse(n<3, 1, fib(n-1)+fib(n-2))
}


server <- function(input, output) {
  
  #currentFib <- fib(as.numeric(input$n))
  currentFib <- function(){
    fib(as.numeric(input$n))
  }
  
  output$fib_num <- renderText({
    #paste("Fibonacci number for the selected number ", input$n, " is = ", currentFib
    paste("Fibonacci number for the selected number ", input$n, " is = ", currentFib())
  })
  
  output$fib_num_inv <- renderText({
    #paste("Inverse of the fibonacci number of ", input$n, " is = ", 1/currentFib)
    paste("Inverse of the fibonacci number of ", input$n, " is = ", 1/currentFib())
  })
}


shinyApp(ui=ui, server=server)