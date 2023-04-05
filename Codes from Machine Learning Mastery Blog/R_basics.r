#Assignment

> # integer
> i <- 23
> i
[1] 23

> # double
> d <- 2.3
> d
[1] 2.3

> # string
> s <- 'hello world'
> s
[1] "hello world"

> # boolean
> b <- TRUE
> b
[1] TRUE

#Data Structures

#Lists

# create a list of named items
a <- list(aa=1, bb=2, cc=3)
a
a$aa

# add a named item to a list
a$dd=4
a

#Vectors

> # create a vector using the c() function
> v <- c(98, 99, 100)
> v
[1]  98  99 100
> v[1:2]
[1] 98 99
 
> # create a vector from a range of integers
> r <- (1:10)
> r
 [1]  1  2  3  4  5  6  7  8  9 10
> r[5:10]
[1]  5  6  7  8  9 10
 
> # add a new item to the end of a vector
> v <- c(1, 2, 3)
> v[4] <- 4
> v
[1] 1 2 3 4

#Matrices

# Create a 2-row, 3-column matrix with named headings
> data <- c(1, 2, 3, 4, 5, 6)
> headings <- list(NULL, c("a","b","c"))
> m <- matrix(data, nrow=2, ncol=3, byrow=TRUE, dimnames=headings)
> m
     a b c
[1,] 1 2 3
[2,] 4 5 6

> m[1,]
a b c 
1 2 3 

> m[,1]
[1] 1 4

#Data Frames

# create a new data frame
years <- c(1980, 1985, 1990)
scores <- c(34, 44, 83)
df <- data.frame(years, scores)
df[,1]
df$years


#Flow Control

#If-Then-Else

# if then else
a <- 66
if (a > 55) {
	print("a is more than 55")
} else {
	print("A is less than or equal to 55")
}

[1] "a is more than 55"

#For Loop

# for loop
mylist <- c(55, 66, 77, 88, 99)
for (value in mylist) {
	print(value)
}

[1] 55
[1] 66
[1] 77
[1] 88
[1] 99

#While Loop

# while loop
a <- 100
while (a < 500) {
	a <- a + 100
}
a

[1] 500

#Functions

#Call Functions

# call function to calculate the mean on a vector of integers
numbers <- c(1, 2, 3, 4, 5, 6)
mean(numbers)

[1] 3.5

#Help for Functions

# help with the mean() function
?mean
help(mean)

#Custom Functions

# define custom function
mysum <- function(a, b, c) {
	sum <- a + b + c
	return(sum)
}
# call custom function
mysum(1,2,3)

[1] 6

#Packages

# help for the caret package
library(help="caret")
















































































































































