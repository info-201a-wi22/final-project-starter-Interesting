library(readr)
setwd("E:/Users/Pen/Documents/Informatics/Projects/final-project-starter-Interesting")
cpi <- read_csv("data/inflation.csv")

library(dplyr)
library(stringi)
mean_cpi <- cpi %>% 
  mutate(Year = stri_sub(Yearmon, -4)) %>%
  group_by(Year) %>% 
  summarize(CPIYearMean = mean(CPI)) %>% 
  filter(between(Year, 1960, 2015))

# highest_cpi <- mean_cpi %>% arrange(desc(CPIYearMean))

fed_rate <- read_csv("data/federal_interest_rates.csv") %>% 
  filter(between(Year, 1960, 2015))
fed_rate_mean <- fed_rate %>% 
  group_by(Year) %>% 
  summarize(RateYearMean = mean(`Effective Federal Funds Rate`, na.rm=TRUE))

inflation_mean <- fed_rate %>% 
  group_by(Year) %>% 
  summarize(InflationMean = mean(`Inflation Rate`, na.rm=TRUE))

unemployment_mean <- fed_rate %>% 
  group_by(Year) %>% 
  summarize(UnemploymentMean = mean(`Unemployment Rate`, na.rm=TRUE)) 

max_inflation_year <- (inflation_mean %>% 
  arrange(desc(InflationMean)))[1,]$Year

max_fed_rate_year <- (fed_rate_mean %>% 
  arrange(desc(RateYearMean)))[1,]$Year

max_unemployment_year <- (unemployment_mean %>% 
  arrange(desc(UnemploymentMean)))[1,]$Year


