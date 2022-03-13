library(shiny)
library(plotly)

source("../source/summary.R")

fed_rate_plot <- ggplot(data = fed_rate_mean, aes(x=Year, y=RateYearMean, fill=factor(ifelse(Year=="1980", "Highlighted", "Normal")))) + 
  geom_bar(stat="identity") + 
  scale_fill_manual(name="Year", values=c("red", "grey50"))
fed_rate_plot %>% plotly::ggplotly()

inflation_plot <- ggplot(data = inflation_mean, aes(x=Year, y=InflationMean)) + 
  geom_bar(stat="identity")
inflation_plot %>% plotly::ggplotly()

barTab <- tabPanel("Interactive Bar Graph",
                                 sidebarLayout(
                                   sidebarPanel(
                                     sliderInput("bargraph_integer", "Integer:",
                                                 min = 1960, max = 2015,
                                                 value = 1980
                                     ),
                                     htmlOutput("explainBarTrend"),
                                   ),
                                   mainPanel(
                                     plotOutput("fedRateBarPlot"),
                                     plotOutput("inflationBarPlot")
                                   )
  )
)