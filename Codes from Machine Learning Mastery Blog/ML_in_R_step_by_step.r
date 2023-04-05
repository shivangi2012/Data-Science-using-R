
install.packages("caret", dependencies=c("Depends", "Suggests"))

#Load Data The Easy Way

# attach the iris dataset to the environment
data(iris)
# rename the dataset
dataset <- iris

#Load From CSV

# define the filename
filename <- "iris.csv"
# load the CSV file from the local directory
dataset <- read.csv(filename, header=FALSE)
# set the column names in the dataset
colnames(dataset) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")

#Create a Validation Dataset

# create a list of 80% of the rows in the original dataset we can use for training
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)
# select 20% of the data for validation
validation <- dataset[-validation_index,]
# use the remaining 80% of data to training and testing the models
dataset <- dataset[validation_index,]

#Summarize Dataset

# dimensions of dataset
dim(dataset)

# dimensions of dataset
dim(dataset)

# take a peek at the first 5 rows of the data
head(dataset)

# list the levels for the class
levels(dataset$Species)

# summarize the class distribution
percentage <- prop.table(table(dataset$Species)) * 100
cbind(freq=table(dataset$Species), percentage=percentage)

# summarize attribute distributions
summary(dataset)

#Visualize Dataset
#Univariate Plots

# split input and output
x <- dataset[,1:4]
y <- dataset[,5]

# boxplot for each attribute on one image
par(mfrow=c(1,4))
  for(i in 1:4) {
  boxplot(x[,i], main=names(iris)[i])
}

# barplot for class breakdown
plot(y)

#Multivariate Plots

let�s look at scatterplots of all pairs of attributes and color the points by
 class. In addition, because the scatterplots show that points for each class
 are generally separate, we can draw ellipses around them.

# scatterplot matrix
featurePlot(x=x, y=y, plot="ellipse")

We can also look at box and whisker plots of each input variable again, but
 this time broken down into separate plots for each class. This can help to 
tease out obvious linear separations between the classes.

# box and whisker plots for each attribute
featurePlot(x=x, y=y, plot="box")

 we will use some probability density plots to give nice smooth lines for each
 distribution.

# density plots for each attribute by class value
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)

#Evaluate Some Algorithms

#Test Harness

# Run algorithms using 10-fold cross validation
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

#Build Models

# a) linear algorithms
set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl=control)
# b) nonlinear algorithms
# CART
set.seed(7)
fit.cart <- train(Species~., data=dataset, method="rpart", metric=metric, trControl=control)
# kNN
set.seed(7)
fit.knn <- train(Species~., data=dataset, method="knn", metric=metric, trControl=control)
# c) advanced algorithms
# SVM
set.seed(7)
fit.svm <- train(Species~., data=dataset, method="svmRadial", metric=metric, trControl=control)
# Random Forest
set.seed(7)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl=control)

#Select Best Model

#�summarize accuracy of models
results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))
summary(results)

# compare�accuracy of models
dotplot(results)

# summarize Best Model
print(fit.lda)

#Make Predictions

# estimate skill of LDA on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)











































































