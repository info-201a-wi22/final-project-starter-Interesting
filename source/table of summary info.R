library("dplyr")
library("tidyverse")
library("ggplot2")
library("stringi")

# Table of summary information code
library(readr)

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


firstjoin <- left_join(fed_rate_mean, inflation_mean)
secondjoin <- left_join(firstjoin, unemployment_mean)
meancpi <- read_csv("data/meancpi.csv")
table_of_summary_information <- left_join(secondjoin, meancpi)

write.csv(mean_cpi,"C:/Users/Sj/final-project-starter-Interesting/data/meancpi.csv", row.names = FALSE)

write.csv(table_of_summary_information,"C:/Users/Sj/final-project-starter-Interesting/data/tableofsumm.csv", row.names = FALSE)

