library(shiny)
library(plotly)
source("../source/summary.R")
source("../source/table of summary info.R")

shinyServer(function(input, output){
  output$distPlot <- renderPlotly({

    plot_ly(x = unemployment_mean ,
            y = as.numeric(mean_cpi),
            type="scatter") %>% 
      layout(xaxis=list(title="Unemployment mean Vs CPI mean")) 
  })
  
  output$histPlot <- renderPlotly({
    
    plot_ly(x = unemployment_mean, 
            type="histogram") %>% 
      layout(xaxis=list(title="Unemployment Mean")) 
  })
})
