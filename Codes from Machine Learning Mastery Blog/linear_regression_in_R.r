#Ordinary Least Squares Regression

# load data
data(longley)
# fit model
fit <- lm(Employed~., longley)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley)
# summarize accuracy
mse <- mean((longley$Employed - predictions)^2)
print(mse)

#Stepwize Linear Regression

# load data
data(longley)
# fit model
base <- lm(Employed~., longley)
# summarize the fit
summary(base)
# perform step-wise feature selection
fit <- step(base)
# summarize the selected model
summary(fit)
# make predictions
predictions <- predict(fit, longley)
# summarize accuracy
mse <- mean((longley$Employed - predictions)^2)
print(mse)

#Principal Component Regression

# load the package
library(pls)
# load data
data(longley)
# fit model
fit <- pcr(Employed~., data=longley, validation="CV")
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley, ncomp=6)
# summarize accuracy
mse <- mean((longley$Employed - predictions)^2)
print(mse)

#Partial Least Squares Regression

# load the package
library(pls)
# load data
data(longley)
# fit model
fit <- plsr(Employed~., data=longley, validation="CV")
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley, ncomp=6)
# summarize accuracy
mse <- mean((longley$Employed - predictions)^2)
print(mse)
















