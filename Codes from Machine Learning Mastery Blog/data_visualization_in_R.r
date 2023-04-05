#Univariate Visualization

#Histograms provide a bar chart of a numeric attribute split into bins with the
 height showing the number of instances that fall into each bin.

# load the data
data(iris)
# create histograms for each attribute
par(mfrow=c(1,4))
for(i in 1:4) {
	hist(iris[,i], main=names(iris)[i])
}

#Density Plots
We can smooth out the histograms to lines using a density plot. These are useful
 for a more abstract depiction of the distribution of each variable.

# load libraries
library(lattice)
# load dataset
data(iris)
# create a panel of simpler density plots by attribute
par(mfrow=c(1,4))
for(i in 1:4) {
	plot(density(iris[,i]), main=names(iris)[i])
}

#we can see the double Gaussian distribution with petal measurements. We can 
also see a possible exponential (Lapacian-like) distribution for the Sepal
 width.

#Box And Whisker Plots
The box captures the middle 50% of the data, the line shows the median and the
 whiskers of the plots show the reasonable extent of data. Any dots outside 
the whiskers are good candidates for outliers.

# load dataset
data(iris)
# Create separate boxplots for each attribute
par(mfrow=c(1,4))
for(i in 1:4) {
	boxplot(iris[,i], main=names(iris)[i])
}

#Barplots
If have categorical rather than numeric attributes, we can create barplots 
that given an idea of the proportion of instances that belong to each category.

# load the library
library(mlbench)
# load the dataset
data(BreastCancer)
# create a bar plot of each categorical attribute
par(mfrow=c(2,4))
for(i in 2:9) {
	counts <- table(BreastCancer[,i])
	name <- names(BreastCancer)[i]
	barplot(counts, main=name)
}

#Missing Plot

#You can use a missing plot to get a quick idea of the amount of missing data 
in your dataset. The x axis shows attributes and the y axis shows instances. 
Horizontal lines indicate missing data for an instance, vertical blocks 
represent missing data for an attribute.

# load libraries
library(Amelia)
library(mlbench)
# load dataset
data(Soybean)
# create a missing map
missmap(Soybean, col=c("black", "grey"), legend=FALSE)

#Multivariate Visualization

#Correlation Plot
We can calculate the correlation between each pair of numeric attributes. 
These pair-wise correlations can be plotted in a correlation matrix plot to 
given an idea of which attributes change together.

# load library
library(corrplot)
# load the data
data(iris)
# calculate correlations
correlations <- cor(iris[,1:4])
# create correlation plot
corrplot(correlations, method="circle")

#A dot-representation was used where blue represents positive correlation and
 red negative. The larger the dot the larger the correlation. We can see that
 the matrix is symmetrical and that the diagonal are perfectly positively 
correlated because it shows the correlation of each attribute with itself.

#Scatterplot Matrix
A scatterplot plots two variables together, one on each of the x and y axes 
with points showing the interaction. The spread of the points indicates the 
relationship between the attributes. You can create scatter plots for all 
pairs of attributes in your dataset, called a scatterplot matrix.

# load the data
data(iris)
# pair-wise scatterplots of all 4 attributes
pairs(iris)

Note that the matrix is symmetrical, showing the same plots with axes reversed.

#Scatterplot Matrix By Class
The points in a scatterplot matrix can be colored by the class label in 
classification problems. This can help to spot clear (or unclear) separation 
of classes and perhaps give an idea of how difficult the problem may be.

# load the data
data(iris)
# pair-wise scatterplots colored by class
pairs(Species~., data=iris, col=iris$Species)

#Density By Class
We can review the density distribution of each attribute broken down by class
 value. Like the scatterplot matrix, the density plot by class can help see 
the separation of classes. It can also help to understand the overlap in
 class values for an attribute.

# load the library
library(caret)
# load the data
data(iris)
# density plots for each attribute by class value
x <- iris[,1:4]
y <- iris[,5]
scales <- list(x=list(relation="free"), y=list(relation="free"))
featurePlot(x=x, y=y, plot="density", scales=scales)

#Box And Whisker Plots By Class
We can also review the boxplot distributions of each attribute by class value.
 This too can help in understanding how each attribute relates to the class 
value, but from a different perspective to that of the density plots.

# load the caret library
library(caret)
# load the iris dataset
data(iris)
# box and whisker plots for each attribute by class value
x <- iris[,1:4]
y <- iris[,5]
featurePlot(x=x, y=y, plot="box")

#These plots help to understand the overlap and separation of the attribute-
class groups. We can see some good separation of the Setosa class for the 
Petal Length attribute.



#Data Visualization with the Caret R package

#Scatterplot Matrix
# load the library
library(caret)
# load the data
data(iris)
# pair-wise plots of all 4 attributes, dots colored by class
featurePlot(x=iris[,1:4], y=iris[,5], plot="pairs", auto.key=list(columns=3))

#Density Plots
Density estimation plots (density plots for short) summarize the distribution
 of the data. Like a histogram, the relationship between the attribute values
 and number of observations is summarized, but rather than a frequency, the 
relationship is summarized as a continuous probability density function (PDF). This is the probability that a given observation has a given value.

The density plots can further be improved by separating each attribute by 
their class value for the observation. This can be useful to understand the
 single-attribute relationship with the class values and highlight useful 
structures like linear separability of attribute values into classes.

The example below shows density plots for the iris dataset, showing PDFs for
 how each attribute relates to each class value.

# load the library
library(caret)
# load the data
data(iris)
# density plots for each attribute by class value
featurePlot(x=iris[,1:4], y=iris[,5], plot="density", 
scales=list(x=list(relation="free"), y=list(relation="free")), 
auto.key=list(columns=3))

#Box and Whisker Plots
Box and Whisker plots (or box plots for short) summarize the distribution of a
 given attribute by showing a box for the 25th and 75th percentile, a line in
 the box for the 50th percentile (median) and a dot for the mean. The whiskers
 show 1.5*the height of the box (called the Inter Quartile Range) which 
indicate the expected range of the data and any data beyond those whiskers is 
assumed to be an outlier and marked with a dot.

# load the library
library(caret)
# load the data
data(iris)
# box and whisker plots for each attribute by class value
featurePlot(x=iris[,1:4], y=iris[,5], plot="box", 
scales=list(x=list(relation="free"), y=list(relation="free")), 
auto.key=list(columns=3))
















































