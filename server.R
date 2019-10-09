library(ggplot2)
library(Team05Lab05)

server <- function(input, output) {
  
  fromDate <- reactive({
    format.Date(input$daterange[1] , c("%Y-%m-%dT%H:%mZ"))
  })
  
  toDate <- reactive({
    format.Date(input$daterange[2] , c("%Y-%m-%dT%H:%mZ"))
  })
  
  observe({print(fromDate())})
  
  output$energyplot <- renderPlot({
    Team05Lab05::pie_API_2(input$selected_region, fromDate, toDate)
  })
  
  output$results <- renderTable({
    Team05Lab05::check_fuel_region_time(input$selected_region, "2018-11-16T09:00Z", "2018-12-16T09:00Z")
  }, align = "c")
    
  }