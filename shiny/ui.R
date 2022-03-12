library(shiny)

source('../shiny/summaryTab.R')
source('../shiny/introPage.R')

ui <- navbarPage("Interest-ing!", introTab, summaryTab)