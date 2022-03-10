library(readr)
library(dplyr)
library(stringi)

fed_rate <- read_csv("../data/federal_interest_rates.csv") %>% 
  filter(between(Year, 1960, 2015))

inflation_mean <- fed_rate %>% 
  group_by(Year) %>% 
  summarize("Inflation Mean" = mean(`Inflation Rate`, na.rm=TRUE))
unemployment_mean <- fed_rate %>% 
  group_by(Year) %>% 
  summarize("Unemployment Mean" = mean(`Unemployment Rate`, na.rm=TRUE)) 

chart <- plot(inflation_mean, type = "l", 
              ylab="Unemployment and Inflation Rates", xlab="Years",
              main="Unemployment vs Inflation Rates", col="blue") + 
  lines(unemployment_mean, col="red")
legend("topleft", legend=c("Inflation Rate", "Unemployment Rate"),  fil=c("blue", "red"), cex=0.8)

