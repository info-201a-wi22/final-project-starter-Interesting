library(readr)
cpi <- read_csv("data/inflation.csv")

library(dplyr)
library(stringi)
mean_cpi <- cpi %>% 
  mutate(Year = stri_sub(Yearmon, -4)) %>%
  group_by(Year) %>% 
  summarize(CPIYearMean = mean(CPI)) %>% 
  filter(between(Year, 1960, 2015))

fed_rate <- read_csv("data/federal_interest_rates.csv") %>% 
  filter(between(Year, 1960, 2015))
inflation_mean <- fed_rate %>% 
  group_by(Year) %>% 
  summarize(InflationMean = mean(`Inflation Rate`, na.rm=TRUE))

unemployment_mean <- fed_rate %>% 
  group_by(Year) %>% 
  summarize(UnemploymentMean = mean(`Unemployment Rate`, na.rm=TRUE)) 

plot(inflation_mean, type='l', col='red', xlab='Inflation or Unemployment Amount')
lines(unemployment_mean, col='blue')
legend("topleft",
       c("Inflation Mean", "Unemployment Mean"),
       fill=c("red","blue")
)
