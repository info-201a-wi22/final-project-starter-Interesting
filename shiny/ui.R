library(shiny)

source('./shiny/summaryTab.R')

ui <- navbarPage("Cool Title Here!", summaryTab)