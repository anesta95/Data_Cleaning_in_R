setwd('C:\Users\Adrian\Documents\Data_Journalism\Datacamp Lesson Datafiles')
library(data.table)
food <- fread('food.csv', data.table = FALSE)
summary(food)
head(food)
str(food)
library(dplyr)
glimpse(food)
names(food)
duplicates <- c(4, 6, 11, 13, 15, 17, 18, 20, 22, 
                24, 25, 28, 32, 34, 36, 38, 40, 
                44, 46, 48, 51, 54, 65, 158)
food2 <- food[, -duplicates]
useless <- c(1, 2, 3, 32:41)
food3 <- food2[, -useless]
library(stringr)
nutrition <- str_detect(names(food3), "100g")
summary(food3[, nutrition])
missing <- is.na(food3$sugars_100g)
food3$sugars_100g[missing] <- 0
hist(food3$sugars_100g, breaks = 100)
food4 <- food3[food3$sugars_100g > 0, ]
hist(food4$sugars_100g, breaks = 100)
plastic <- str_detect(food3$packaging, "plasti")
sum(plastic)
