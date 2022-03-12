library(shiny)
source("../source/table of summary info.R")

server <- function (input, output) {
  output$result <- renderText((input$research))
}