#Load Data and Standard Machine Learning Datasets

install.packages("mlbench")
library(mlbench)
data(package="mlbench")
data(PimaIndiansDiabetes)
head(PimaIndiansDiabetes)

#Understand Data with Descriptive Statistics

data(iris)
summary(iris)

#Understand Data with Visualization

data(iris)
pairs(iris)

#Prepare For Modeling by Pre-Processing Data

install.packages("caret")
# load caret package
library(caret)
# load the dataset
data(iris)
# calculate the pre-process parameters from the dataset
preprocessParams <- preProcess(iris[,1:4], method=c("range"))
# transform the dataset using the pre-processing parameters
transformed <- predict(preprocessParams, iris[,1:4])
# summarize the transformed dataset
summary(transformed)

#Algorithm Evaluation With Resampling Methods

#The dataset used to train a machine learning algorithm is called a training dataset. The dataset
#used to train an algorithm cannot be used to give you reliable estimates of the accuracy of the 
#model on new data. This is a big problem because the whole idea of creating the model is to make 
#predictions on new data.
#You can use statistical methods called resampling methods to split your training dataset up into 
#subsets, some are used to train the model and others are held back and used to estimate the accuracy
#model on unseen data.

#Your goal with todays lesson is to practice using the different resampling methods available in 
#the caret package. Look up the help on the createDataPartition(), trainControl() and train() 
#functions in R.

#Split a dataset into training and test sets.
#Estimate the accuracy of an algorithm using k-fold cross validation.
#Estimate the accuracy of an algorithm using repeated k-fold cross validation.

#The snippet below uses the caret package to estimate the accuracy of the Naive Bayes algorithm on 
#the iris dataset using 10-fold cross validation.

# load the library
library(caret)
# load the iris dataset
data(iris)
# define training control
trainControl <- trainControl(method="cv", number=10)
# estimate the accuracy of Naive Bayes on the dataset
fit <- train(Species~., data=iris, trControl=trainControl, method="knn")
# summarize the estimated accuracy
print(fit)

#Algorithm Evaluation Metrics

#There are many different metrics that you can use to evaluate the skill of a machine learning 
#algorithm on a dataset.

#You can specify the metric used for your test harness in caret in the train() function and defaults
#can be used for regression and classification problems. Your goal with todays lesson is to practice
#using the different algorithm performance metrics available in the caret package.

#Practice using the Accuracy and Kappa metrics on a classification problem (e.g. iris dataset).
#Practice using RMSE and RSquared metrics on a regression problem (e.g. longley dataset).
#Practice using the ROC metrics on a binary classification problem (e.g. PimaIndiansDiabetes dataset from the mlbench package).

#The snippet below demonstrates calculating the LogLoss metric on the iris dataset.

# load caret library
library(caret)
# load the iris dataset
data(iris)
# prepare 5-fold cross validation and keep the class probabilities
control <- trainControl(method="cv", number=5, classProbs=TRUE, summaryFunction=mnLogLoss)
# estimate accuracy using LogLoss of the CART algorithm
fit <- train(Species~., data=iris, method="rpart", metric="logLoss", trControl=control)
# display results
print(fit)

#Spot-Check Algorithms

#Spot check linear algorithms on a dataset (e.g. linear regression, logistic regression and linear
#discriminate analysis).
#Spot check some non-linear algorithms on a dataset (e.g. KNN, SVM and CART).
#Spot-check some sophisticated ensemble algorithms on a dataset (e.g. random forest and stochastic
#gradient boosting).
#Help: You can get a list of models that you can use in caret by typing: names(getModelInfo())

#For example, the snippet below spot-checks two linear algorithms on the Pima Indians Diabetes 
#dataset from the mlbench package.

# load libraries
library(caret)
library(mlbench)
# load the Pima Indians Diabetes dataset
data(PimaIndiansDiabetes)
# prepare 10-fold cross validation
trainControl <- trainControl(method="cv", number=10)
# estimate accuracy of logistic regression
set.seed(7)
fit.lr <- train(diabetes~., data=PimaIndiansDiabetes, method="glm", trControl=trainControl)
# estimate accuracy of linear discriminate analysis
set.seed(7)
fit.lda <- train(diabetes~., data=PimaIndiansDiabetes, method="lda", trControl=trainControl)
# collect resampling statistics
results <- resamples(list(LR=fit.lr, LDA=fit.lda))
# summarize results
summary(results)

#Model Comparison and Selection

#Use the summary() caret function to create a table of results
#Use the dotplot() caret function to compare results.
#Use the bwplot() caret function to compare results.
#Use the diff() caret function to calculate the statistical significance between results.
#The snippet below extends yesterdays example and creates a plot of the spot-check results.

# load libraries
library(caret)
library(mlbench)
# load the Pima Indians Diabetes dataset
data(PimaIndiansDiabetes)
# prepare 10-fold cross validation
trainControl <- trainControl(method="cv", number=10)
# estimate accuracy of logistic regression
set.seed(7)
fit.lr <- train(diabetes~., data=PimaIndiansDiabetes, method="glm", trControl=trainControl)
# estimate accuracy of linear discriminate analysis
set.seed(7)
fit.lda <- train(diabetes~., data=PimaIndiansDiabetes, method="lda", trControl=trainControl)
# collect resampling statistics
results <- resamples(list(LR=fit.lr, LDA=fit.lda))
# plot the results
dotplot(results)

#Improve Accuracy with Algorithm Tuning

#Once you have found one or two algorithms that perform well on your dataset, you may want to improve the performance of those models.

#One way to increase the performance of an algorithm is to tune it's parameters to your specific 
#dataset.

#The caret package provides three ways to search for combinations of parameters for a machine 
#learning algorithm. Your goal in todays lesson is to practice each.

#Tune the parameters of an algorithm automatically (e.g. see the tuneLength argument to train()).
#Tune the parameters of an algorithm using a grid search that you specify.
#Tune the parameters of an algorithm using a random search.
#Take a look at the help for the trainControl() and train() functions and take note of the method 
#and the tuneGrid arguments.

# load the library
library(caret)
# load the iris dataset
data(iris)
# define training control
trainControl <- trainControl(method="cv", number=10)
# define a grid of parameters to search for random forest
grid <- expand.grid(.mtry=c(1,2,3,4,5,6,7,8,10))
# estimate the accuracy of Random Forest on the dataset
fit <- train(Species~., data=iris, trControl=trainControl, tuneGrid=grid, method="rf")
# summarize the estimated accuracy
print(fit)

#Improve Accuracy with Ensemble Predictions

#Another way that you can improve the performance of your models is to combine the predictions 
#from multiple models.

#Some models provide this capability built-in such as random forest for bagging and stochastic
#gradient boosting for boosting. Another type of ensembling called stacking (or blending) can 
#learn how to best combine the predictions from multiple models and is provided in the package 
#caretEnsemble.

#In todays lesson you will practice using ensemble methods.

#Practice bagging ensembles with the random forest and bagged CART algorithms in caret.
#Practice boosting ensembles with the gradient boosting machine and C5.0 algorithms in caret.
#Practice stacking ensembles using the caretEnsemble package and the caretStack() function.

# Load packages
library(mlbench)
library(caret)
library(caretEnsemble)
# load the Pima Indians Diabetes dataset
data(PimaIndiansDiabetes)
# create sub-models
trainControl <- trainControl(method="cv", number=5, savePredictions=TRUE, classProbs=TRUE)
algorithmList <- c('knn', 'glm')
set.seed(7)
models <- caretList(diabetes~., data=PimaIndiansDiabetes, trControl=trainControl, methodList=algorithmList)
print(models)
# learn how to best combine the predictions
stackControl <- trainControl(method="cv", number=5, savePredictions=TRUE, classProbs=TRUE)
set.seed(7)
stack.glm <- caretStack(models, method="glm", trControl=stackControl)
print(stack.glm)

#Finalize And Save Your Model

#Once you have found a well performing model on your machine learning problem, you need to
#finalize it.

#Practice using the predict() function to make predictions with a model trained using caret.
#Practice training standalone versions of well performing models.
#Practice saving trained models to file and loading them up again using the saveRDS() and readRDS() functions.

#For example, the snippet below shows how you can create a random forest algorithm trained on your 
#dataset ready for general use.

# load package
library(randomForest)
# load iris data
data(iris)
# train random forest model
finalModel <- randomForest(Species~., iris, mtry=2, ntree=2000)
# display the details of the final model
print(finalModel)




























The snippet below uses is an example of using a grid search for the random forest algorithm on the iris dataset.












































