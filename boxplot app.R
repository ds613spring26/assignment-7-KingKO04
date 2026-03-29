# AUTHOR: Kaodinna Onwumechili

# business logic
library(shiny)
count <- 200

# user interface
ui <- bootstrapPage(
  selectInput(
    "plot_type", 
    "Plot Type", 
    c("Histogram" = "hist", "Boxplot" = "boxplot")
  ),
  numericInput('count', "Number of obs", count),
  plotOutput("plot")
)

# server
server <- function(input, output) {
  output$plot <- renderPlot(
    ifelse(
      input$plot_type == "hist",
      hist(runif(input$count), col = "red"), 
      boxplot(runif(input$count), col = "red"))
  )
}

# launch app
shinyApp(ui, server)