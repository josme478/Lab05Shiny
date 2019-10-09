library(ggplot2)
library(Team05Lab05)

server <- function(input, output) {
  
  fromDate <- reactive({
    format.Date(input$daterange[1] , c("%Y-%m-%dT%H:%mZ"))
  })
  
  toDate <- reactive({
    format.Date(input$daterange[2] , c("%Y-%m-%dT%H:%mZ"))
  })
  
  output$energyplot <- renderPlot({
    Team05Lab05::pie_API_2(input$selected_region, fromDate(), toDate())
  })
  
  output$results <- renderTable({
    Team05Lab05::check_fuel_region_time(input$selected_region, fromDate(), toDate())
  }, align = "c")
    
  }