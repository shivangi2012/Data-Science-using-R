#1. Make Predictions On New Data

# load libraries
library(caret)
library(mlbench)
# load dataset
data(PimaIndiansDiabetes)
# create 80%/20% for training and validation datasets
set.seed(9)
validation_index <- createDataPartition(PimaIndiansDiabetes$diabetes, p=0.80, list=FALSE)
validation <- PimaIndiansDiabetes[-validation_index,]
training <- PimaIndiansDiabetes[validation_index,]
# train a model and summarize model
set.seed(9)
control <- trainControl(method="cv", number=10)
fit.lda <- train(diabetes~., data=training, method="lda", metric="Accuracy", trControl=control)
print(fit.lda)
print(fit.lda$finalModel)
# estimate skill on validation dataset
set.seed(9)
predictions <- predict(fit.lda, newdata=validation)
confusionMatrix(predictions, validation$diabetes)

#Create A Standalone Model

# load libraries
library(caret)
library(mlbench)
library(randomForest)
# load dataset
data(Sonar)
set.seed(7)
# create 80%/20% for training and validation datasets
validation_index <- createDataPartition(Sonar$Class, p=0.80, list=FALSE)
validation <- Sonar[-validation_index,]
training <- Sonar[validation_index,]
# train a model and summarize model
set.seed(7)
control <- trainControl(method="repeatedcv", number=10, repeats=3)
fit.rf <- train(Class~., data=training, method="rf", metric="Accuracy", trControl=control, ntree=2000)
print(fit.rf)
print(fit.rf$finalModel)
# create standalone model using all training data
set.seed(7)
finalModel <- randomForest(Class~., training, mtry=2, ntree=2000)
# make a predictions on "new data" using the final model
final_predictions <- predict(finalModel, validation[,1:60])
confusionMatrix(final_predictions, validation$Class)

#Save and Load Your Model

# load libraries
library(caret)
library(mlbench)
library(randomForest)
library(doMC)
registerDoMC(cores=8)
# load dataset
data(Sonar)
set.seed(7)
# create 80%/20% for training and validation datasets
validation_index <- createDataPartition(Sonar$Class, p=0.80, list=FALSE)
validation <- Sonar[-validation_index,]
training <- Sonar[validation_index,]
# create final standalone model using all training data
set.seed(7)
final_model <- randomForest(Class~., training, mtry=2, ntree=2000)
# save the model to disk
saveRDS(final_model, "./final_model.rds")

# later...

# load the model
super_model <- readRDS("./final_model.rds")
print(super_model)
# make a predictions on "new data" using the final model
final_predictions <- predict(super_model, validation[,1:60])
confusionMatrix(final_predictions, validation$Class)




