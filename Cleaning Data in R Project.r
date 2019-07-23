getwd()
weather <- readRDS('weather.rds')
class(weather)
dim(weather)
names(weather)
str(weather)
library(dplyr)
glimpse(weather)
summary(weather)
head(weather)
head(weather, n = 10)
tail(weather)
tail(weather, n = 15)
library(tidyr)
weather2 <- gather(weather, day, value, X1:X31, na.rm = TRUE)
head(weather2)
without_x <- weather2[, -1]
weather3 <- spread(without_x, measure, value)
head(weather3)
library(stringr)
library(lubridate)
weather3$day <- str_replace(weather3$day, "X", "")
weather4 <- unite(weather3, date, year, month, day, sep = "-")
weather4$date <- ymd(weather4$date)
weather5 <- select(weather4, date, Events, CloudCover:WindDirDegrees)
head(weather5)
str(weather5)
head(weather5, n = 20)
weather5$PrecipitationIn <- str_replace(weather5$PrecipitationIn, "T", "0")
weather6 <- mutate_at(weather5, vars(CloudCover:WindDirDegrees), funs(as.numeric))
str(weather6)
sum(is.na(weather6))
summary(weather6)
ind <- which(is.na(weather6$Max.Gust.SpeedMPH))
weather6[ind, ]
ind <- which(weather6$Max.Humidity == 1000)
weather6[ind, ]
weather6$Max.Humidity[ind] <- 100
ind <- which(weather6$Mean.VisibilityMiles == -1)
weather6[ind, ]
weather6$Mean.VisibilityMiles[ind] <- 10
hist(weather6$MeanDew.PointF)
hist(weather6$Min.TemperatureF)
hist(weather6$Mean.TemperatureF)
weather6$events[weather6$events == ""] <- "None"

