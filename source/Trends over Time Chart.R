library("dplyr")
library("tidyverse")
library("ggplot2")
library("stringi")

# Trends over Time chart Code 
# Looking at both the CPI and the Federal Rate from the year 1960 to 2015


cpi <- read_csv(file = "data/inflation.csv", show_col_types = FALSE) %>% 
  mutate(Year = stri_sub(Yearmon, -4)) %>%
  group_by(Year) %>% 
  summarize("Annual CPI Mean" = mean(CPI)) %>%
  filter(between(Year, 1960, 2015))
cpi$Year <- as.numeric(as.character(cpi$Year))
fed_rate <- read_csv("data/federal_interest_rates.csv", show_col_types = FALSE) %>% 
  group_by(Year) %>% 
  summarize("Federal Rate" = mean(`Effective Federal Funds Rate`, na.rm=TRUE)) %>%
  filter(between(Year, 1960, 2015))

cpi_fed_rate_ToT <- merge(cpi, fed_rate, by= "Year",all.x=TRUE) %>% 
  gather(key = Rates, value = Amount, -Year)


trend_chart <- ggplot(cpi_fed_rate_ToT, group = 1) +
  geom_point(mapping = aes(x = Year, y = Amount, color = Rates)) +
  geom_line(mapping = aes(x = Year, y = Amount, color = Rates)) +
  labs(title = "Federeal Rate vs Annual CPI Mean by the years",
       subtitle = "Looking at the two rates from the years 1960 to 2015",
       x = "Years",
       y = "Annual Rate")
plot(trend_chart)


