library(readr)

cpi <- read_csv("./data/inflation.csv")

library(dplyr)
library(stringi)
mean_cpi <- cpi %>% 
  mutate(Year = stri_sub(Yearmon, -4)) %>%
  group_by(Year) %>% 
  summarize(CPIYearMean = mean(CPI)) %>% 
  filter(between(Year, 1960, 2015))

# highest_cpi <- mean_cpi %>% arrange(desc(CPIYearMean))

fed_rate <- read_csv("./data/federal_interest_rates.csv") %>% 
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

max_inflation <- inflation_mean %>% 
  filter(InflationMean == max(InflationMean)) %>% pull(InflationMean)
max_inflation_year <- inflation_mean %>% 
  filter(InflationMean == max(InflationMean)) %>% pull(Year)
min_inflation <- inflation_mean %>% 
  filter(InflationMean == min(InflationMean)) %>% pull(InflationMean)
min_inflation_year <- inflation_mean %>% 
  filter(InflationMean == min(InflationMean)) %>% pull(Year)

max_fed_rate <- fed_rate_mean %>% 
  filter(RateYearMean == max(RateYearMean)) %>% pull(RateYearMean)
max_fed_rate_year <- fed_rate_mean %>% 
  filter(RateYearMean == max(RateYearMean)) %>% pull(Year)
min_fed_rate <- fed_rate_mean %>% 
  filter(RateYearMean == min(RateYearMean)) %>% pull(RateYearMean)
min_fed_rate_year <- fed_rate_mean %>% 
  filter(RateYearMean == min(RateYearMean)) %>% pull(Year)

max_unemployment <- unemployment_mean %>% 
  filter(UnemploymentMean == max(UnemploymentMean)) %>% pull(UnemploymentMean)
max_unemployment_year <- unemployment_mean %>% 
  filter(UnemploymentMean == max(UnemploymentMean)) %>% pull(Year)
min_unemployment <- unemployment_mean %>% 
  filter(UnemploymentMean == min(UnemploymentMean)) %>% pull(UnemploymentMean)
min_unemployment_year <- unemployment_mean %>% 
  filter(UnemploymentMean == min(UnemploymentMean)) %>% pull(Year)

