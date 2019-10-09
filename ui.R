library(shiny)
ui <- fluidPage(
  titlePanel("Fuels used to generate electricity on UK", "Carbon API APP"),
  sidebarLayout(
    sidebarPanel(
      "With this app, you can see the fuels used in the UK to generate electricity, within a time interval.",
      br(), br(),
      "Inside the App data is also contained predictions for future days",
      br(), br(),
      dateRangeInput("daterange", "Date Range YYYY-MM-DD", startview="year"),
      br(),
      selectInput("selected_region", "Select a Region", Team05Lab05::regions()[[2]])
    ),
    
    mainPanel(
      plotOutput("energyplot"),
      tableOutput("results")
    )
  )
  
)