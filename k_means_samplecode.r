#Set working directory
getwd()
setwd("G:/")

#Loading data
library(tidyr)
library(corrplot)
library(gridExtra)
library(ggplot2)
library(GGally)

data<-read.csv("seeds_dataset1.csv")
#Print first 6 observations
head(data)
#Give column names to variables
names(data)<-c("Area","Perimeter","Compactness","Length of Kernel","Width of Kernel","Asymmetry Coefficient",
               "Length of Kernel Groove","Class")
#Check structure of data
str(data)

#Check summary of data
summary(data)

#Check for missing values
colSums(is.na(data))
sum(is.na(data))
#We don't need the Class column.k-means is an unsupervised machine learning algorithm and works with unlabeled data.

# Remove the Type column
data <- data[,-8]
head(data)
#Data analysis

# Histogram for each Attribute
data %>%
  gather(Attributes, value, 1:7) %>%
  ggplot(aes(x=value)) +
  geom_histogram(fill="lightblue2", colour="black") +
  facet_wrap(~Attributes, scales="free_x") +
  labs(x="Values", y="Frequency") 


# Correlation matrix 
corrplot(cor(data), type="upper", method="ellipse", tl.cex=0.9)
corrplot(cor(data), type="upper", method="number", tl.cex=0.9)

#Data preparation

# Normalization
norm_data <- as.data.frame(scale(data))

# Original data
p1 <- ggplot(data, aes(x=Area, y=Perimeter)) +
  geom_point() +
  labs(title="Original data")

# Normalized data 
p2 <- ggplot(norm_data, aes(x=Area, y=Perimeter)) +
  geom_point() +
  labs(title="Normalized data")

# Subplot
grid.arrange(p1, p2, ncol=2)

#k-means execution
set.seed(1234)
model <- kmeans(norm_data, centers=3)
model
# Cluster to which each point is allocated
model$cluster
# Cluster centers
model$centers
# Cluster size
model$size
# Between-cluster sum of squares
model$betweenss
# Within-cluster sum of squares
model$withinss
# Total within-cluster sum of squares 
model$tot.withinss
# Total sum of squares
model$totss

bsss <- numeric()
wsss <- numeric()
# Run the algorithm for different values of k 
set.seed(12345)
for(i in 1:10){
  
  # For each k, calculate betweenss and tot.withinss
  bsss[i] <- kmeans(norm_data, centers=i)$betweenss
  wsss[i] <- kmeans(norm_data, centers=i)$tot.withinss
}

# Between-cluster sum of squares vs Choice of k
p3 <- qplot(1:10, bsss, geom=c("point", "line"), 
            xlab="Number of clusters", ylab="Between-cluster sum of squares") +
  scale_x_continuous(breaks=seq(0, 10, 1))

# Total within-cluster sum of squares vs Choice of k
p4 <- qplot(1:10, wsss, geom=c("point", "line"),
            xlab="Number of clusters", ylab="Total within-cluster sum of squares") +
  scale_x_continuous(breaks=seq(0, 10, 1))

# Subplot
grid.arrange(p3, p4, ncol=2)
#Result

# Mean values of each cluster
aggregate(data, by=list(model$cluster), mean)

# Clustering 
ggpairs(cbind(data, Cluster=as.factor(model$cluster)),
        columns=1:6, aes(colour=Cluster, alpha=0.5),
        lower=list(continuous="points"),
        upper=list(continuous="blank"),
        axisLabels="none", switch="both")

#Silhouette analysis
#Silhouette analysis allows you to calculate how similar each observations is with
#the cluster it is assigned relative to other clusters. This metric (silhouette 
#width) ranges from -1 to 1 for each observation in your data and can be 
#interpreted as follows:
  
#Values close to 1 suggest that the observation is well matched to the assigned cluster
#Values close to 0 suggest that the observation is borderline matched between two clusters
#Values close to -1 suggest that the observations may be assigned to the wrong cluster
