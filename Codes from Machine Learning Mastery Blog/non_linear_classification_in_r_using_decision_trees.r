#Classification and Regression Trees

# load the package
library(rpart)
# load data
data(iris)
# fit model
fit <- rpart(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4], type="class")
# summarize accuracy
table(predictions, iris$Species)

#C4.5

# load the package
library(RWeka)
# load data
data(iris)
# fit model
fit <- J48(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])

#PART

# load the package
library(RWeka)
# load data
data(iris)
# fit model
fit <- PART(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])
# summarize accuracy
table(predictions, iris$Species)

#Bagging CART

# load the package
library(ipred)
# load data
data(iris)
# fit model
fit <- bagging(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4], type="class")
# summarize accuracy
table(predictions, iris$Species)

#Random Forest

# load the package
library(randomForest)
# load data
data(iris)
# fit model
fit <- randomForest(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])
# summarize accuracy
table(predictions, iris$Species)

#Gradient Boosted Machine

# load the package
library(gbm)
# load data
data(iris)
# fit model
fit <- gbm(Species~., data=iris, distribution="multinomial")
# summarize the fit
print(fit)
# make predictions
predictions <- predict(fit, iris)
# summarize accuracy
table(predictions, iris$Species)

#Boosted C5.0

# load the package
library(C50)
# load data
data(iris)
# fit model
fit <- C5.0(Species~., data=iris, trials=10)
# summarize the fit
print(fit)
# make predictions
predictions <- predict(fit, iris)
# summarize accuracy
table(predictions, iris$Species)














