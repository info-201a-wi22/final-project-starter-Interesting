library(shiny)
library(plotly)

source("../source/summary.R")

fed_rate_plot <- ggplot(data = fed_rate_mean, aes(x=Year, y=RateYearMean)) + 
  geom_bar(stat="identity")
fed_rate_plot %>% plotly::ggplotly()

inflation_plot <- ggplot(data = inflation_mean, aes(x=Year, y=InflationMean)) + 
  geom_bar(stat="identity")
inflation_plot %>% plotly::ggplotly()

interactiveBarTrends <- tabPanel("Interactive Bar Graph",
                     h1("Interactive Bar Graph"),
                     plotOutput("inflationBarPlot")
)