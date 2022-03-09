library("dplyr")
library("tidyverse")
library("ggplot2")
library("stringi")


table_of_summary_information <- read_csv("data/tableofsumm.csv")
# Bar chart of Mean rate of inflation and mean rate of CPI
Inflationtable <- table_of_summary_information %>%
  select(Year,InflationMean)
counts <- table(Inflationtable$Year)
barplot(counts, main="Mean Inflation over time",
        xlab="Years")