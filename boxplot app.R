# AUTHOR: Kaodinna Onwumechili

# business logic
library(shiny)
count <- 200

# user interface
ui <- bootstrapPage(
  numericInput('count', "Number of obs", count),
  plotOutput("plot")
)