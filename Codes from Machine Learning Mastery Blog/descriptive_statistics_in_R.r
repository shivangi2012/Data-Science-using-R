install.packages("e1071", "mlbench")

#Look at data

# load the library
library(mlbench)
# load the dataset
data(PimaIndiansDiabetes)
# display first 20 rows of data
head(PimaIndiansDiabetes, n=20)

#Dimensions of data

# display the dimensions of the dataset
dim(PimaIndiansDiabetes)

#Data Types

# load library
library(mlbench)
# load dataset
data(BostonHousing)
# list types for each attribute
sapply(BostonHousing, class)

#Class Distribution
In a classification problem, you must know the proportion of instances that 
belong to each class value.
This is important because it may highlight an imbalance in the data, that if 
severe may need to be addressed with rebalancing techniques. In the case of a
 multi-class classification problem, it may expose class with a small or zero
instances that may be candidates for removing from the dataset.

# distribution of class variable
y <- PimaIndiansDiabetes$diabetes
cbind(freq=table(y), percentage=prop.table(table(y))*100)

#Data Summary

#The function creates a table for each attribute and lists a breakdown of 
values. Factors are described as counts next to each class label.

# load the iris dataset
data(iris)
# summarize the dataset
summary(iris)

#Standard Deviations

The standard deviation along with the mean are useful to know if the data has 
a Gaussian (or nearly Gaussian) distribution. For example, it can useful for
 a quick and dirty outlier removal tool, where any values that are more than
 three times the standard deviation from the mean are outside of 99.7 of the
 data.

# calculate standard deviation for all attributes
sapply(PimaIndiansDiabetes[,1:8], sd)

#Skewness
If a distribution looks kind-of-Gaussian but is pushed far left or right it is
 useful to know the skew.
Getting a feeling for the skew is much easier with plots of the data, such as
 a histogram or density plot. It is harder to tell from looking at means,
 standard deviations and quartiles.
Nevertheless, calculating the skew up front gives you a reference that you can use later if you decide to correct the skew for an attribute.

# load libraries
library(mlbench)
library(e1071)
# load the dataset
data(PimaIndiansDiabetes)
# calculate skewness for each variable
skew <- apply(PimaIndiansDiabetes[,1:8], 2, skewness)
# display skewness, larger/smaller deviations from 0 show more skew
print(skew)

#The further the distribution of the skew value from zero, the larger the 
skew to the left (negative skew value) or right (positive skew value).

#Correlations
For numeric attributes, an excellent way to think about attribute-to-attribute
 interactions is to calculate correlations for each pair of attributes.

# calculate a correlation matrix for numeric variables
correlations <- cor(PimaIndiansDiabetes[,1:8])
# display the correlation matrix
print(correlations)

#This creates a symmetrical table of all pairs of attribute correlations for
 numerical data. Deviations from zero show more positive or negative 
correlation. Values above 0.75 or below -0.75 are perhaps more interesting as
 they show a high correlation. Values of 1 and -1 show full positive or 
negative correlation.








































