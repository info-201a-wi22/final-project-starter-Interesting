library(shiny)

source("../source/summary.R")

summaryTab <- tabPanel("Summary",
           h1("Summary of the Federal Reserve!"),
           h4("The federal reserve reactively determines interest rate to maintain a stable economy. The main goals of this project is to determine just how 
              effective the federal reserve is at its job by answering a few questions."),
           
           tags$li("What are the factors that determines the federal interest rate?"),           
           tags$li("What intended effects are considered when calculating the federal interest rate?"),           
           tags$li("What sort of outcomes have the shift of the federal interest rate over time caused our economy?"),
           
           h4("What are the factors that determines the federal interest rate?"),
           p("The federal interest rate is determined by a variety of factors that are too nuanced to delve into independently. 
           However, one major factor we've noticed is the direct proportionality to the inflation rate. We can see this where the date of the 
           highest inflation rate in the year ", max_inflation_year, " is directly followed by the highest interest rate in the year", max_fed_rate_year, "."),
           
           h4("What intended effects are considered when calculating the federal interest rate?"),
           p("The intended effects are to maintain the integrity of the United States and subsequently world economy, as seen by the stock market fluctuations after a 
             fed meeting. The effects, although difficult to conclude with such a limited data set, seem to point in the direction that the fed is doing its job. 
             Various factors such as the decline in the rate of inflation after federal rate adjustments has seen inflation rates go down. That being said, 
             people have to want to take out loans in order for the interest rate to take money out of the economy as well as be enticed to take loans to 
             further the economy."),
           
           h4("What sort of outcomes have the shift of the federal interest rate over time caused our economy?"),
           p("This one is a little hard to say. Whereas proof of a perfectly running fed would ideally result in a flat inflation curve, that simply is not the case as from
             ", year_start," to ", year_end, ", the Consumer Price Index went from ", mean_cpi_start," to ", mean_cpi_end," That being said however, it is evident that certain inflation trends 
             have been seen to decrease after the interest rate was risen to compensate.")
        )