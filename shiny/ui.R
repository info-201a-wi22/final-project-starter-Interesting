library(shiny)

source('./summaryTab.R')
source('./introPage.R')
source('./dataTrend.R')

ui <- navbarPage("Interest-ing!", introTab, interactiveTrends, summaryTab)
