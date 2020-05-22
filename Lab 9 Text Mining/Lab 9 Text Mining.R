#Load required libraries
library(dplyr)
library(tm)
library(SnowballC)

#Load the dataset
#restReviews = read.delim2("D:/Downloads/Firefox/RestReviews.tsv", sep = "\t") # delim2 doesn't read correctly
restReviews = readr::read_tsv('D:/Downloads/Firefox/RestReviews.tsv')

head(restReviews)
View(restReviews)

restReviews$Liked = factor(restReviews$Liked)

dim(restReviews)
#CORPUS for Rest Reviews

#Preliminary corpus
corpusRR = VCorpus(VectorSource(restReviews$Review)) %>%
  tm_map(removePunctuation) %>%
  tm_map(removeNumbers) %>%
  tm_map(content_transformer(tolower)) %>%
  tm_map(removeWords, stopwords("english")) %>%
  tm_map(stripWhitespace) %>%
  tm_map(stemDocument)

#Create term-document metrics & remove spare terms

dtmRR = DocumentTermMatrix(corpusRR)
dtmRR

dim(dtmRR)

inspect(dtmRR)

#remove spare terms
dtmRR = removeSparseTerms(dtmRR,0.98)
dtmRR

inspect(dtmRR)

#Naive_Bayes Classifier

#Creating train ad test sets
RowNumbers = sample(1:nrow(dtmRR), 0.8*nrow(dtmRR))
df_train = dtmRR[RowNumbers, ]
df_test = dtmRR[-RowNumbers,]


#Fetching target variable(Liked column)
dftrain_labels <- restReviews[RowNumbers, ]$Liked
dftest_labels <- restReviews[-RowNumbers, ]$Liked

#Fitting in Naive Bayes algorithm
library(e1071)
model <- naiveBayes(as.matrix(df_train), dftrain_labels)

#Predicting the outcome for test set
pred <- predict(model, as.matrix(df_test))
head(pred)

#Finding Accuracy
library(MLmetrics)
Accuracy(pred, dftest_labels)
