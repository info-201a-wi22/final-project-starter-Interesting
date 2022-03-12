library(shiny)
library(ggplot2)
library(stringr)
source("../source/table of summary info.R")

server <- function (input, output) {
  output$researchQuestion <- renderText((input$research))
  
  output$plotTrend <- renderPlot({
    
    trend_plot <- table_of_summary_information %>%
      filter(Year >= input$rangeTrend[1], Year <= input$rangeTrend[2])

    trend_plotted <- ggplot(
      data = trend_plot, 
      mapping = aes_string(y = input$dataTrend, x = "Year", color = input$dataTrend)
      ) +
      geom_point()
    
    if (input$trendLine) {
      trend_plotted <- trend_plotted + geom_smooth(se = FALSE, formula = y ~ x, method = loess)
    }
    
    trend_plotted
  })
  
  output$explanationTrend  <- renderText({
    trendLabel <- c("Federal Interest Rate" = "Federal_rate_YearlyMean", 
                    "Inflation Rate" = "Inflation_YearlyMean", 
                    "Unemployment Rate" = "Unemployment_YearlyMean",
                    "Consumer Price Index" = "CPI_YearlyMean")
    nameData <- names(trendLabel)[trendLabel == input$dataTrend]
    paste("This is the ", nameData, "between the years ", input$rangeTrend[1],
                 "and ", input$rangeTrend[2])
  })
}