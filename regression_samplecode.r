library(ggplot2)
library(GGally)
library(scatterplot3d)
data(trees)
head(trees)
str(trees)
#plot matrix to see how the variables relate to one another.
ggpairs(data=trees,columns=1:3,title="trees data")
fit_1<-lm(Volume~Girth,data=trees)
summary(fit_1)

#histogram to visualize residuals
ggplot(data=trees, aes(fit_1$residuals)) + 
  geom_histogram(binwidth = 1, color = "black", fill = "purple4") +
  theme(panel.background = element_rect(fill = "white"),
        axis.line.x=element_line(),
        axis.line.y=element_line()) +
  ggtitle("Histogram for Model Residuals") 

#Let's have a look at our model fitted to our data for width and volume.
ggplot(data = trees, aes(x = Girth, y = Volume)) + geom_point()  +
  stat_smooth(method = "lm", col = "dodgerblue3") +
  theme(panel.background = element_rect(fill = "white"),
        axis.line.x=element_line(),
        axis.line.y=element_line()) +
  ggtitle("Linear Model Fitted to Data")

predict(fit_1,data.frame(Girth=18.2))

fit_2 <- lm(Volume ~ Girth + Height, data = trees)
summary(fit_2)

Girth <- seq(9,21, by=0.5) ## make a girth vector
Height <- seq(60,90, by=0.5) ## make a height vector
pred_grid <- expand.grid(Girth = Girth, Height = Height)  ## make a grid using the vectors

#we make predictions for volume based on the predictor variable grid:
  
pred_grid$Volume2 <-predict(fit_2, new = pred_grid)

fit_3 <- lm(Volume ~ Girth * Height, data = trees)
summary(fit_3)

#we can make a 3d scatterplot from the predictor grid and the predicted volumes:
  
fit_2_sp <- scatterplot3d(pred_grid$Girth, pred_grid$Height, pred_grid$Volume2, angle = 60, color = "dodgerblue", pch = 1, 
                            ylab = "Hight (ft)", xlab = "Girth (in)", zlab = "Volume (ft3)" )
#finally overlay our actual observations to see how well they fit:
  
fit_2_sp$points3d(trees$Girth, trees$Height, trees$Volume, pch=16)


predict(fit_3, data.frame(Girth = 18.2, Height = 72))

Girth <- seq(9,21, by=0.5)
Height <- seq(60,90, by=0.5)
pred_grid <- expand.grid(Girth = Girth, Height = Height)

pred_grid$Volume3 <-predict(fit_3, new = pred_grid)

fit_3_sp <- scatterplot3d(pred_grid$Girth, pred_grid$Height, pred_grid$Volume3, angle = 60, color = "dodgerblue", pch = 1, ylab = "Hight (ft)", xlab = "Girth (in)", zlab = "Volume (ft3)")
fit_3_sp$points3d(trees$Girth, trees$Height, trees$Volume, pch=16)



