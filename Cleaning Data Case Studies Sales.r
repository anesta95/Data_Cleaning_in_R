setwd('C:\Users\Adrian\Documents\Data_Journalism\Datacamp Lesson Datafiles')
sales <- read.csv('sales.csv', stringsAsFactors = FALSE)
dim(sales)
head(sales)
names(sales)
str(sales)
summary(sales)
library(dbplyr)
library(dplyr)
glimpse(sales)
sales2 <- sales[,-1]
keep <- c(5:(ncol(sales2) - 15))
sales3 <- sales2[,keep]
library(tidyr)
sales4 <- separate(sales3, event_date_time,
                   c("event_dt", "event_time"), sep = " ")
sales5 <- separate(sales4, sales_ord_create_dttm, c("ord_create_dt", "ord_create_time"), sep = " ")
issues <- c(2516, 3863, 4082, 4183)
sales3$sales_ord_create_dttm[issues]
sales3$sales_ord_create_dttm[2517]
library(stringr)
date_cols <- str_detect(names(sales5), "dt")
library(lubridate)
sales5[, date_cols] <- lapply(sales5[, date_cols], ymd)
missing <- lapply(sales5[, date_cols], is.na)
num_missing <- sapply(missing, sum)
print(num_missing)
sales6 <- unite(sales5, venue_city_state, venue_city, venue_state, sep = ", ")
head(sales6)
str(sales6)


