pred <-read.csv("./data/PredictiveAnalysis.csv")

library(rpart)

# grow tree 
fit <- rpart(Airport ~ Visitors,
             method="class", data=pred)

printcp(fit) # display the results 
plotcp(fit) # visualize cross-validation results 
summary(fit) # detailed summary of splits

# plot tree 
plot(fit, uniform=TRUE, 
     main="Classification Tree for most popular Airports")
text(fit, use.n=TRUE, all=TRUE, cex=.8)

#--------------------------------------------

# Conditional Inference Tree for Kyphosis
library(party)
fit <- ctree(Airport ~ Visitors, 
             data=pred)
plot(fit, main="Conditional Inference Tree for most popular Airports")

#------------------------------------------

library(randomForest)
fit <- randomForest(Airport ~ Visitors, data=pred)
print(fit) # view results 
importance(fit) # importance of each predictor

#------------------------------------------


