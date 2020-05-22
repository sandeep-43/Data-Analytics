setwd("D:/Docs/Sandeep/Colleges/Lambton/Term 2/2018S-T2 BDM 1053 - Big Data Algorithms and Statistics 01/Assignments/08 Assignment 8/")
df = read.csv("Insurance Policy Dataset.csv")
#View(df)

library(corrgram)

#First we find the fields that are closely related.

corrgram(df)

#After finding the closely related fields, we plot the graph.

#plot(df['Premiums.Paid'],df['Income'])
plot(Premiums.Paid ~ Income, df , main = "Premiums Paid vs Income")

#We create 5 clusters for closely related points and plot the graph
kc = kmeans(df,5)
plot(Premiums.Paid ~ Income, df, col= kc$cluster, main = "Premiums Paid vs Income")

#Next we plot cluster for complete dataframe
wss = NULL
for(i in 1:15)
{
  set.seed(140)
  
  kmeans_temp =kmeans(df,centers = i)
  wss[i]= sum(kmeans_temp$withinss)
  
}
#We plot elbow graph to check the value of K
plot(1:15,wss,type="b",xlab="Number of clusters",ylab = "wss")

set.seed(140)
kmeans_Model =kmeans(df,5)
str(kmeans_temp)

library(cluster)
clusplot(x =df,clus =kmeans_Model$cluster,color = T ,labels =2,lines =0,
         main="Clustering",sub = "4 Cluster Model")
