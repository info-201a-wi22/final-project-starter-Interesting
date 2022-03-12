library(shiny)

source('./summaryTab.R')
source('./barTrendTab.R')
source('./introPage.R')
source('./dataTrend.R')

ui <- navbarPage("Interest-ing!", introTab, interactiveTrends, interactiveBarTrends, summaryTab)
