library(shiny)
library(plotly)
my.ui <- navbarPage(
          tabPanel("Histogram",
         sidebarLayout(
           sidebarPanel(
             sliderInput("Year",
                         "Years for data of Unemployment mean vs CPI mean:",
                         min = 1960,
                         max = 2015,
                         value = 1960)
           ),
           
         
           mainPanel(
             plotlyOutput("histPlot")
           )
         )
          )
)
shinyUI(my.ui)