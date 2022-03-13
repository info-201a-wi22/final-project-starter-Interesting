library(shiny)
source('./shiny/introPage.R')
source('./shiny/dataTrendPage.R')
source('./shiny/dataBarPage.R')
source('./shiny/histogramPage.R')
source('./shiny/summaryPage.R')
source('./shiny/reportPage.R')

ui <- navbarPage("Interest-ing!", introTab, trendTab, barTab, histogramTab, summaryTab, reportTab)
