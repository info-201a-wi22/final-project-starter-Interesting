library(shiny)
library(ggplot2)
library(stringr)
source("../source/table of summary info.R")
source("../source/summary.R")

server <- function (input, output) {
  output$researchQuestion <- renderText((input$research))
  
  output$histPlot <- renderPlotly({
    histLabel <- c("Federal Interest Rate" = "Federal_rate_YearlyMean", 
                    "Inflation Rate" = "Inflation_YearlyMean", 
                    "Unemployment Rate" = "Unemployment_YearlyMean",
                    "Consumer Price Index" = "CPI_YearlyMean")
    nameHist1 <- names(histLabel)[histLabel == input$histVar1]
    nameHist2 <- names(histLabel)[histLabel == input$histVar2]
    plot1 <- plot_ly(table_of_summary_information,
      x = ~get(input$histVar1),
      y = ~get(input$histVar2), 
      type = 'scatter',
      mode = 'markers') %>% 
      layout(title="Unemployment mean Vs CPI mean", 
             xaxis = list(title = nameHist1), yaxis = list(title = nameHist2))
    
    })
  
  
  output$fedRateBarPlot <- renderPlot({
    fed_rate_plot <- ggplot(data = fed_rate_mean, aes(x=Year, y=RateYearMean, fill=factor(ifelse(Year==input$bargraph_integer[1], "Highlighted", "Normal")))) + 
      geom_bar(stat="identity") + 
      scale_fill_manual(name="Year", values=c("red", "grey50"))
    fed_rate_plot
  })
  
  output$inflationBarPlot <- renderPlot({
    inflation_plot <- ggplot(data = inflation_mean, aes(x=Year, y=InflationMean, fill=factor(ifelse(Year==input$bargraph_integer[1], "Highlighted", "Normal")))) + 
      geom_bar(stat="identity") + 
      scale_fill_manual(name="Year", values=c("red", "grey50"))
    inflation_plot
  })
  
  output$explainBarTrend  <- renderUI({
    inf <- inflation_mean %>% filter(Year==input$bargraph_integer[1]) %>% pull(InflationMean)
    fed <- fed_rate_mean %>% filter(Year==input$bargraph_integer[1]) %>% pull(RateYearMean)
    div(p("Year: ", input$bargraph_integer[1]),
    p("Federal Rate: ", fed),
    p("Inflation: ", inf))
  })
  
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