#Classification and Regression Trees

# load the package
library(rpart)
# load data
data(longley)
# fit model
fit <- rpart(Employed~., data=longley, control=rpart.control(minsplit=5))
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
mse <- mean((longley$Employed - predictions)^2)
print(mse)

#Conditional Decision Trees

# load the package
library(party)
# load data
data(longley)
# fit model
fit <- ctree(Employed~., data=longley, controls=ctree_control(minsplit=2,minbucket=2,testtype="Univariate"))
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
mse <- mean((longley$Employed - predictions)^2)
print(mse)

#Model Trees

# load the package
library(RWeka)
# load data
data(longley)
# fit model
fit <- M5P(Employed~., data=longley)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
mse <- mean((longley$Employed - predictions)^2)
print(mse)

#Rule System

# load the package
library(RWeka)
# load data
data(longley)
# fit model
fit <- M5Rules(Employed~., data=longley)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
mse <- mean((longley$Employed - predictions)^2)
print(mse)

#Bagging CART

# load the package
library(ipred)
# load data
data(longley)
# fit model
fit <- bagging(Employed~., data=longley, control=rpart.control(minsplit=5))
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
mse <- mean((longley$Employed - predictions)^2)
print(mse)

#Random Forest

# load the package
library(randomForest)
# load data
data(longley)
# fit model
fit <- randomForest(Employed~., data=longley)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
mse <- mean((longley$Employed - predictions)^2)
print(mse)

#Gradient Boosted Machine

# load the package
library(gbm)
# load data
data(longley)
# fit model
fit <- gbm(Employed~., data=longley, distribution="gaussian")
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley)
# summarize accuracy
mse <- mean((longley$Employed - predictions)^2)
print(mse)

#Cubist

# load the package
library(Cubist)
# load data
data(longley)
# fit model
fit <- cubist(longley[,1:6], longley[,7])
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley[,1:6])
# summarize accuracy
mse <- mean((longley$Employed - predictions)^2)
print(mse)










































































