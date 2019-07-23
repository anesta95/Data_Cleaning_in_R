getwd()
setwd('C:\Users\Adrian\Documents\Data_Journalism\Datacamp Lesson Datafiles')
bmi <- read.csv('BMIdata.csv')
class(bmi)
dim(bmi)
names(bmi)
str(bmi)
library(dplyr)
glimpse(bmi)
summary(bmi)
head(bmi)
tail(bmi)
hist(bmi$Y2008)
plot(bmi$Y1980, bmi$Y2008)
library(tidyr)
students <- read.csv('studentdatawdates.csv')
str(students)
students$Grades <- as.character(students$Grades)
students$Medu <- as.factor(students$Medu)
students$Fedu <- as.factor(students$Fedu)
str(students)
library(lubridate)
dmy("17 Sep 2015")
mdy_hm("July 15, 2012 12:56")
students$dob <- ymd(students$dob)
students$nurse_visit <- ymd_hms(students$nurse_visit)
str(students)
library(stringr)
c("   Filip ", "Nick  ", " Jonathan")
str_trim(c("   Filip ", "Nick  ", " Jonathan"))
c("23485W", "8823453Q", "994Z")
str_pad(c("23485W", "8823453Q", "994Z"), width = 9, side = "left", pad = "0")
str_detect(students$dob, '1997')
students$sex <- str_replace(students$sex, "F", "Female")
students$sex <- str_replace(students$sex, "M", "Male")
head(students)
summary(students)
hist(students$absences)
hist(students$absences, right = FALSE)
boxplot(students$absences)
