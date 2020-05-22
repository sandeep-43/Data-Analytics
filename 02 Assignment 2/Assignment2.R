setwd("D:/Docs/Sandeep/Colleges/Lambton/Term 2/2018S-T2 BDM 1053 - Big Data Algorithms and Statistics 01/Assignments/02 Assignment 2")

library(RODBC)

#Assignment2.mdb has been created as per the image provided in the question
mdbConnect = odbcConnectAccess("Assignment2.mdb")


myQuery = "Select * from Table1"
sqlTables = (mdbConnect)
myData = sqlQuery(channel = mdbConnect, query = myQuery)
View(myData)


#Question1
#Import the data into R and calculate the mean of the weights for people having height more than 4.7

myQuery1 = "Select avg(Weight) as Mean from Table1 where Height>4.7"
#sqlTables = (mdbConnect)
myData1 = sqlQuery(channel = mdbConnect, query = myQuery1)
View(myData1)


#Question2
#Change the bobby weight to 45

myQuery2 = "UPDATE Table1 SET Weight=45 where Names='Bobby'"
#sqlTables = (mdbConnect)
sqlQuery(channel = mdbConnect, query = myQuery2)
myQuery2 = "Select * from Table1"
myData2 = sqlQuery(channel = mdbConnect, query = myQuery2)
View(myData2)

odbcClose(mdbConnect)
