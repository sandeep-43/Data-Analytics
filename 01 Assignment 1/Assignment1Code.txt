library("DAAG")
library("lubridate")

data(jobs)
head(jobs)
nrow(jobs)

#Q1. Create an Alberta and BC data frame and combine it with the jobs dataset 

#Cleaning the existing dataframe since BC and Alberta already exists.
newJobsDataFrame = jobs[,3:7]
View(newJobsDataFrame)


#Read csv file
setwd("D:/Docs/Sandeep/Colleges/Lambton/Term 2/2018S-T2 BDM 1053 - Big Data Algorithms and Statistics 01/Assignments/01 Assignment 1")

# A csv file 2states.csv was created which contains the data for BD and Alberta
otherStates = read.csv("2states.csv")
View(otherStates)


#Fixing the date format

fDates = vector(mode="character", nrow(jobs))

for(i in 1:nrow(jobs))
{
  fDates[i] = format(x = date_decimal(1900 + jobs[i, 7]), "%d-%m-%Y")
}
View(fDates)

#To check no. of rows of each dataset for binding the columns
nrow(otherStates)
nrow(newJobsDataFrame)
#nrow(dateFormatted)

#Finally combining all the relevant entries

FinalDataFrame = cbind(newJobsDataFrame[,1:4],otherStates,fDates)
write.csv(FinalDataFrame,"FinalDataSet.csv", row.names = FALSE)
View(FinalDataFrame)


#Q2.Find the month with the highest total employment across the states.
BCmax = max(FinalDataFrame$BC)
View(filter(FinalDataFrame,FinalDataFrame$BC==BCmax)[,c(5,7)])

ALmax = max(FinalDataFrame$Alberta)
View(filter(FinalDataFrame,FinalDataFrame$Alberta==ALmax)[,c(6,7)])

PRmax = max(FinalDataFrame$Prairies)
View(filter(FinalDataFrame,FinalDataFrame$Prairies==PRmax)[,c(1,7)])

ONmax = max(FinalDataFrame$Ontario)
View(filter(FinalDataFrame,FinalDataFrame$Ontario==ONmax)[,c(2,7)])

QBmax = max(FinalDataFrame$Quebec)
View(filter(FinalDataFrame,FinalDataFrame$Quebec==QBmax)[,c(3,7)])

ATmax = max(FinalDataFrame$Atlantic)
View(filter(FinalDataFrame,FinalDataFrame$Atlantic==ATmax)[,c(4,7)])


#Q3.Find the months in which employment figures in Atlantic went below 950.
View(cbind("Atlantic" = FinalDataFrame[,4],filter(FinalDataFrame,FinalDataFrame$Atlantic<950))[,c(5,8)])


#Q4. Sort the figures for Quebec in ascending order
View(FinalDataFrame[order(FinalDataFrame$Quebec, decreasing = FALSE),])
