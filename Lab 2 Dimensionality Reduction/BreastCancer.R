setwd("C:\\Users\\Sandeep Singh\\Desktop\\Jupyter Projects\\New folder")

BCData = read.csv(file = "breast-cancer-data.csv")

View(BCData)

nrow(BCData)

str(BCData)

BCData$diagnosis = factor(BCData$diagnosis, levels = c("M","B"), labels = c(0,1)) # 

BCData$diagnosis = as.numeric(BCData$diagnosis)

View(BCData)

pca = prcomp(BCData,scale. = T)

summary(pca)

PoV <- pca$sdev^2/sum(pca$sdev^2)

PoV[1:3]

biplot(pca)

biplot(pca, scale = 0)

plot(PoV, xlab = "Principal Component", ylab = "Proportion of variance explained", type = "b")

