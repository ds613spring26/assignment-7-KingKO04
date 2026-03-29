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
  selectInput("color", "Color", unique(c("black", colors()))),
  numericInput('count', "Number of obs", count),
  plotOutput("plot")
)

# server
server <- function(input, output)
  output$plot <- renderPlot(
    ifelse(
      input$plot_type == "hist",
      hist(runif(input$count), col = input$color), 
      boxplot(runif(input$count), col = input$color))
  )

# launch app
shinyApp(ui, server)