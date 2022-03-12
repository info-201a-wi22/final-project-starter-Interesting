library(shiny)



introTab <- tabPanel("Intro",
                       titlePanel("Introduction about the Federal Reserve!"),
                       mainPanel(
                         h3("What is our topic about specifically?"),
                         HTML(paste(
                           p(HTML('&emsp;'), "Using datasets and findings from doing extensive research into our topic, we aimed to understand the state of our economy between the rising of inflation, the regularly updated federal rates, and the basket of goods that consumers spend money on in their day-to-day lives."))),
                         img(src = "risingPercentage.jpg", height = 400, width = 700),
                         h4("We'll be exploring the following question on our topic:"),
                         selectInput(inputId = "research", 
                                   label ="The Questions:",
                                   c("Research Question 1" = "What are the factors that determines the federal interest rate?", 
                                     "Research Question 2" = "What intended effects are considered when calculating the federal interest rate?", 
                                     "Research Question 3" = "What sort of outcomes have the shift of the federal interest rate over time caused our economy?")),
                         textOutput("researchQuestion"),
                         p(),
                         p(em("The datasets we'll be utilizing:")),
                         HTML(paste(
                           p(a("Federal Reserve Interest Rates, 1954-Present", href="https://www.kaggle.com/federalreserve/interest-rates"), 
                             p(a("Historical Federal Interest Rates-Daily", href="https://www.kaggle.com/dennisholeski/historical-fed-funds")),
                             p(a("U.S. Inflation Data", href="https://www.kaggle.com/varpit94/us-inflation-data-updated-till-may-2021")),
                             p(a("US Consumer Price Index and Inflation (CPI)", href="https://www.kaggle.com/tunguz/us-consumer-price-index-and-inflation-cpi"))))
                     ))
)
