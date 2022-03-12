library(shiny)
library(plotly)

interactiveTrends <- tabPanel("Trend Tab",
                              titlePanel("Looking over trends"),
                              sidebarLayout(
                                sidebarPanel(
                                  selectInput("dataTrend", 
                                              label = "Data to examine", 
                                              choices = list("Federal Interest Rate" = "Federal_rate_YearlyMean", 
                                                             "Inflation Rate" = "Inflation_YearlyMean", 
                                                             "Unemployment Rate" = "Unemployment_YearlyMean",
                                                             "Consumer Price Index" = "CPI_YearlyMean")),
                                  sliderInput(
                                    inputId = "rangeTrend",
                                    label = "Between the years (inclusive)", min = 1960, max = 2015, value = c(1961, 2010)
                                  ),
                                  
                                  checkboxInput("trendLine", label = strong("Show Trendline"), value = TRUE),
                                  
                                  textOutput("explanationTrend"),
                                ),
                                mainPanel(
                                  plotOutput("plotTrend")
                                )
                              )
)