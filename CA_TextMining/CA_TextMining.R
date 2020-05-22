install.packages('tm')
install.packages('SnowballC')

library(dplyr)
library(tm)
library(SnowballC)

bookHP6 = readLines("D:/Downloads/Firefox/HP6 - The Half Blood Prince.txt")
bookHP7 = readLines("D:/Downloads/Firefox/HP7 - Deathly Hollows.txt")

corpusHP6 = Corpus(VectorSource(bookHP6)) %>%
            tm_map(removePunctuation) %>%
            tm_map(removeNumbers) %>%
            tm_map(content_transformer(tolower)) %>%
            tm_map(removeWords, stopwords("english")) %>%
            tm_map(stripWhitespace) %>%
            tm_map(stemDocument)
            
corpusHP6

dtmHP6 = DocumentTermMatrix(corpusHP6)
dtmHP6

dim(dtmHP6)

inspect(dtmHP6[1:10,1:10])

dtmHP6 = removeSparseTerms(dtmHP6,0.98)
dtmHP6

inspect(dtmHP6[1:10,1:10])

dtmHP6 = DocumentTermMatrix(corpusHP6)
dtmHP6

#Calculate and sort by word frequencies
word.freqHP6 = sort(colSums(as.matrix(dtmHP6)),decreasing = T)
head(word.freqHP6)


#Create frequency table
tableHP6 = data.frame(word = names(word.freqHP6),
                      absolute.frequency = word.freqHP6,
                      relative.frequency = word.freqHP6/length(word.freqHP6))
head(tableHP6)


#Remove the words from the row names
rownames(tableHP6) = NULL

#Show the 6 most common words
head(tableHP6)

#Export the 1000 most common words in CSV file
write.csv(tableHP6[1:100,],"D:/HP6_1000.csv")


#CORPUS for HP7

#Preliminary corpus
corpusHP7 = Corpus(VectorSource(bookHP7)) %>%
            tm_map(removePunctuation) %>%
            tm_map(removeNumbers) %>%
            tm_map(content_transformer(tolower)) %>%
            tm_map(removeWords, stopwords("english")) %>%
            tm_map(stripWhitespace) %>%
            tm_map(stemDocument)

#Create term-document metrics & remove spare terms

dtmHP7 = DocumentTermMatrix(corpusHP7)
dtmHP7

dim(dtmHP7)

inspect(dtmHP7[1:100,1:100])
dtmHP7 = removeSparseTerms(dtmHP7,0.98)
dtmHP7

inspect(dtmHP7[1:100,1:100])

#Calculate and sort by word frequencies
word.freqHP7 = sort(colSums(as.matrix(dtmHP7)), decreasing = T)
head(word.freqHP7)

#Create frequency table
tableHP7 = data.frame(word = names(word.freqHP7),
                      absolute.frequency = word.freqHP7,
                      relative.frequency = word.freqHP7/length(word.freqHP7))

#Remove the words from the row names
rownames(tableHP7) = NULL

head(tableHP7)

#Export the 1000 most common words in CSV file
write.csv(tableHP7[1:1000,], "D:/HP7_1000.csv")


#Comparing the two books

finalTable = tableHP6 %>%
  merge(tableHP7, by = "word") %>%
  mutate(dProp = relative.frequency.x - relative.frequency.y, dAbs = abs(dProp)) %>%
  arrange(desc(dAbs)) %>%
  rename(HP6.freq = absolute.frequency.x, HP6.prop = relative.frequency.x,
         HP7.freq = absolute.frequency.y , HP7.prop = relative.frequency.y)

head(finalTable)
