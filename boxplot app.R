# AUTHOR: Kaodinna Onwumechili

# business logic
library(shiny)
count <- 200

# user interface
ui <- bootstrapPage(
  numericInput('count', "Number of obs", count),
  plotOutput("plot")
)

# server
server <- function(input, output) {
  output$plot <- renderPlot({
    boxplot(runif(input$count), col = "red")
  })
}