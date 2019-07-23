setwd('C:\Users\Adrian\Documents\Data_Journalism\Datacamp Lesson Datafiles')
library(readxl)
att <- read_excel('attendance.xls')
names(att)
head(att)
tail(att)
str(att)
head(att, n = 20)
att[50:60,]
att[, 1:3]
att[55:65,]
att[65:70,]
missing <- is.na(att$..2)
att2 <- att[-missing,]
head(att2)
tail(att2)
att2[55:65,]
missing
missing2 <- is.na(att$..2)
att3 <- att2[-c(missing2)]
att3 <- att2[-c(missing2),]
missing3 <- c(1, 8, 14, 20, 26, 32, 38, 44, 50, 56, 63:66)
att4 <- att3[-missing3,]
remove <- c(3, 5, 7, 9, 11, 13, 15, 17)
att5 <- att4[,-remove]
att_elem <- att4[,c(1, 6, 7)]
att_sec <- att4[,c(1, 8, 9)]
att5 <- att4[,c(1:5)]
cnames <- c("state", "avg_attend_pct", "avg_hr_per_day", 
            "avg_day_per_yr", "avg_hr_per_yr")
colnames(att5) <- cnames
att6 <- att5[-c(1,2),]
names(att6)
library(stringr)
att6$state <- str_replace_all(att6$state, "\\.", "")
att6$state <- str_trim(att6$state)
head(att6)
library(dplyr)
att7 <- mutate_at(att6, vars(-state), funs(as.numeric))
head(att7)
