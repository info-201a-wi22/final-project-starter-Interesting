library(shiny)
source('./introPage.R')
source('./dataTrendPage.R')
source('./dataBarPage.R')
source('./histogramPage.R')
source('./summaryPage.R')
source('./reportPage.R')

ui <- navbarPage("Interest-ing!", introTab, trendTab, barTab, histogramTab, summaryTab, reportTab)
