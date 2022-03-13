library(shiny)
library(plotly)

histogramTab<- tabPanel("Interactive Histogram",
                                 sidebarLayout(
                                   sidebarPanel(
                                     selectInput("histVar1", 
                                                 label = "Variable input for x", 
                                                 choices = list("Federal Interest Rate" = "Federal_rate_YearlyMean", 
                                                                "Inflation Rate" = "Inflation_YearlyMean", 
                                                                "Unemployment Rate" = "Unemployment_YearlyMean",
                                                                "Consumer Price Index" = "CPI_YearlyMean")),
                                   selectInput("histVar2", 
                                               label = "Variable input for y", 
                                               choices = list("Federal Interest Rate" = "Federal_rate_YearlyMean", 
                                                              "Inflation Rate" = "Inflation_YearlyMean", 
                                                              "Unemployment Rate" = "Unemployment_YearlyMean",
                                                              "Consumer Price Index" = "CPI_YearlyMean")),
           ),
           mainPanel(
             plotlyOutput("histPlot")
           ))
)