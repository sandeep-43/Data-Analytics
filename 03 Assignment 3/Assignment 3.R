#Setting the current working directory
setwd("D:/Docs/Sandeep/Colleges/Lambton/Term 2/2018S-T2 BDM 1053 - Big Data Algorithms and Statistics 01/Assignments/03 Assignment 3")

#Importing the libraries
library("MASS")
library("dplyr")
#Viewing the contents of the Boston dataframe
View(Boston)

#Looking of help
?Boston

#Q (a)
#Counting the number of rows and columns
nrow(Boston)
ncol(Boston)

#(b)

plot(Boston$black, Boston$crim,xlab ="proportion of blacks by town" , ylab="per capita crime rate by town",main = "Blacks v/s Crime")
plot(Boston$age, Boston$tax, xlab = "proportion of owner-occupied units built prior to 1940", ylab = "full-value property-tax rate per $10,000", main = "Age v/s Taxes")
plot(Boston$dis, Boston$indus, xlab = "weighted mean of distances to five Boston employment centres", ylab = "proportion of non-retail business acres per town", main = "Distance v/s Non-retail Business")
plot(Boston$ptratio,Boston$lstat,xlab = "pupil-teacher ratio by town", ylab = "lower status of the population (percent)", main = "Pupil-teacher v/s lower status")
plot(Boston$zn, Boston$nox, xlab = "proportion of residential land zoned for lots over 25,000 sq.ft", ylab = "nitrogen oxides concentration (parts per 10 million)", main = "Land size v/s NO2 concentration")

#(c)
?boxplot

boxplot(Boston$crim ~ Boston$zn)
boxplot(Boston$crim ~ Boston$indus)
boxplot(Boston$crim ~ Boston$chas)
boxplot(Boston$crim ~ Boston$nox)
boxplot(Boston$crim ~ Boston$rm)
boxplot(Boston$crim ~ Boston$age)
boxplot(Boston$crim ~ Boston$dis)
boxplot(Boston$crim ~ Boston$rad)
plot(Boston$crim,Boston$rad)
boxplot(Boston$crim ~ Boston$tax)
boxplot(Boston$crim ~ Boston$ptratio)
boxplot(Boston$crim ~ Boston$black)
boxplot(Boston$crim ~ Boston$lstat)
boxplot(Boston$crim ~ Boston$medv)


#(d)
View(filter(Boston, Boston$crim>50))
boxplot(Boston$crim)
boxplot(Boston$tax)
boxplot(Boston$ptratio)
boxplot(Boston)
summary(Boston)
#(e)
count(filter(Boston,chas == '1'))

#(f)
median(Boston$ptratio)

#(g)
Min = min(Boston$medv)
View(filter(Boston, Boston$medv == Min),"Records for minimum medv")
summary(Boston$medv)

#(h)
count(filter(Boston, Boston$rm>7))

count(filter(Boston, Boston$rm>8))

View(filter(Boston, Boston$rm>8),"Average dwellings > 8")


