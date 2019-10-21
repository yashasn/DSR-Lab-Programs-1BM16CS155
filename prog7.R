data(cars)

#Loading dataset and performing linear regression
model<-lm(speed ~ dist, data=cars)
summary(model)

#Finding confidnce intervals for parameters
confint(model, level=0.95)

#Plotting data points and lin reg line
plot(cars$dist, cars$speed, main="Speed vs Distance", xlab="Distance", ylab="Speed", col="red")
abline(model, col="green")

#Predicting value of outcome variable for given value of input variable using 95% confidence interval
dist<-67
df=data.frame(dist)
predict(model, df, level=0.95, interval="confidence")
