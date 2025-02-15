setwd("D:/Docs/Sandeep/Colleges/Lambton/Term 2/2018S-T2 BDM 1053 - Big Data Algorithms and Statistics 01/Assignments/04 Assignment 4")

airlines = read.csv("airline_dec_2008_50k.csv")
#View(airlines)
#dim(airlines[1])

#Q1. Suppose arrival delays of flights belonging to "AA" are normally 
#distributed with mean 15   minutes and standard deviation 3 minutes. 
#If the "AA" plans to announce a scheme where it   will give 50% 
#cash back if their flights are delayed by 20 minutes, 
#how much percentage of   the trips "AA" is supposed to loose this money. 

question1 = pnorm(20, mean=15, sd=3 )
question1


#Q2. Assume that 65% of flights are diverted due to bad weather 
#through the Weather System.    What is the probability that in a 
#random sample of 10 flights, 6 are diverted through the Weather system.

question2 = dbinom(6, size=10,0.65)
question2
