library("dplyr")
library("tidyverse")
library("ggplot2")
library("stringi")

source("./source/table of summary info.R")

# Bar chart of Mean rate of inflation and mean rate of CPI
Inflation_CPI_table <- table_of_summary_information %>%
  select(Year,Inflation_YearlyMean, CPI_YearlyMean)

barplot(t(as.matrix(Inflation_CPI_table[, 2:3])), 
        beside = TRUE,
        names.arg = Inflation_CPI_table$Year,
        ylim = c(0,250),
        ylab = "number of individuals",
        xlab = "Length class (cm)")
legend("topleft", legend=c("Inflation Rate", "CPI Rate"),  fil=c("white", "dark gray"), cex=0.8)
