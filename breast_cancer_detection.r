#This breast cancer database was obtained from the University of Wisconsin Hospitals, Madison from  UCI machine learning repository.Each instance has one of 2 possible classes: benign or malignant. Here, we are classifying instances into belign or malignant using KNN algorithm. 

#Number of instances: 698
#Number of Attributes: 10 plus the class attribute

#Attribute Information: (class attribute has been moved to last column)

#  Attribute                     Domain
-- -----------------------------------------
  #  1. Sample code number            id number
  #  2. Clump Thickness               1 - 10
  #  3. Uniformity of Cell Size       1 - 10
  #  4. Uniformity of Cell Shape      1 - 10
  #  5. Marginal Adhesion             1 - 10
  #  6. Single Epithelial Cell Size   1 - 10
  #  7. Bare Nuclei                   1 - 10
  #  8. Bland Chromatin               1 - 10
  #  9. Normal Nucleoli               1 - 10
  # 10. Mitoses                       1 - 10
  # 11. Class:                        (2 for benign, 4 for malignant)

# Class distribution:
#Benign: 458 (65.5%)
#Malignant: 241 (34.5%)

#Load file
data<-read.csv("breast-cancer-data.csv")

#Print first 6 observations
head(data)

#Give column names to variables
names(data)<-c("Code no","Thickness","Cell Size","Cell Shape","Adhesion","Epithelial Cell Size","Nuclei",
               "Chromatin","Nucleoli","Mitoses","Class")
head(data)

#Check structure of data
str(data)

#Check summary of data
summary(data)

#Convert factor variable nucei to integer because to use knn algorithm in class package, variables should be numeric
data$Nuclei<-as.integer(data$Nuclei)

#Drop code no. variable
data<-data[-1]

#Check for missing values
colSums(is.na(data))
sum(is.na(data))

#Check no. of benign and malignant cells. 2 for benign and 4 for malignant
table(data$Class)

#Change labels of Class variable. 1 for benign cell and 2 for malignant cell.
data$Class<-factor(data$Class,levels=c(2,4),labels=c(1,2))
data$Class<-as.integer(data$Class)
str(data)

#Check proportion of benign and malignant cells
round(prop.table(table(data$Class))*100,digits=1)

#For reproducible results
set.seed(123)

#Create training and test data
index<-sample(1:nrow(data),size=500)
train<-data[index,]
test<-data[-index,]

#Check dimensions of train and test data
dim(train)
dim(test)

#Create labels for train and test data i.e. variable containg class
train_labels<-train[,10]
test_labels<-test[,10]

head(train)
head(test)
head(train_labels)
head(test_labels)

# load the class library to use knn function
library(class)

#Train model on data and classify test data
predict<-knn(train=train,test=test,cl=train_labels,k=26)
predict

# load the gmodels library to use Cross tabulation function
library(gmodels)

# Cross tabulation of predicted vs. actual
CrossTable(x=test_labels,y=predict,prop.chisq=FALSE)

#Improving model performance

#trying different values of k
predict1<-knn(train=train,test=test,cl=train_labels,k=1)
predict1
CrossTable(x=test_labels,y=predict1,prop.chisq=FALSE)

predict2<-knn(train=train,test=test,cl=train_labels,k=5)
predict2
CrossTable(x=test_labels,y=predict2,prop.chisq=FALSE)

predict3<-knn(train=train,test=test,cl=train_labels,k=10)
predict3
CrossTable(x=test_labels,y=predict3,prop.chisq=FALSE)

predict4<-knn(train=train,test=test,cl=train_labels,k=15)
predict4
CrossTable(x=test_labels,y=predict4,prop.chisq=FALSE)

predict5<-knn(train=train,test=test,cl=train_labels,k=20)
predict5
CrossTable(x=test_labels,y=predict5,prop.chisq=FALSE)


