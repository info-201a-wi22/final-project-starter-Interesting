library(shiny)

source('../shiny/summaryTab.R')
source('../shiny/introPage.R')
source('../shiny/dataTrend.R')

ui <- navbarPage("Interest-ing!", introTab, interactiveTrends, summaryTab)