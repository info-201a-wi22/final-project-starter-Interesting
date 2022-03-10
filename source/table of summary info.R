library("dplyr")
library("tidyverse")
library("ggplot2")
library("stringi")

# Table of summary information code
library(readr)

cpi <- read_csv("../data/inflation.csv")

library(dplyr)
library(stringi)
mean_cpi <- cpi %>% 
  mutate(Year = stri_sub(Yearmon, -4)) %>%
  group_by(Year) %>% 
  summarize(CPI_YearlyMean = mean(CPI)) %>% 
  filter(between(Year, 1960, 2015))
mean_cpi$Year <- as.numeric(as.character(mean_cpi$Year))

# highest_cpi <- mean_cpi %>% arrange(desc(CPIYearMean))

fed_rate <- read_csv("../data/federal_interest_rates.csv") %>% 
  filter(between(Year, 1960, 2015))
fed_rate_mean <- fed_rate %>% 
  group_by(Year) %>% 
  summarize(Federal_rate_YearlyMean = mean(`Effective Federal Funds Rate`, na.rm=TRUE))

inflation_mean <- fed_rate %>% 
  group_by(Year) %>% 
  summarize(Inflation_YearlyMean = mean(`Inflation Rate`, na.rm=TRUE))

unemployment_mean <- fed_rate %>% 
  group_by(Year) %>% 
  summarize(Unemployment_YearlyMean = mean(`Unemployment Rate`, na.rm=TRUE)) 


firstjoin <- left_join(fed_rate_mean, inflation_mean)
secondjoin <- left_join(firstjoin, unemployment_mean)
table_of_summary_information <- left_join(secondjoin, mean_cpi)

