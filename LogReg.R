library(titanic)
library(ROCR)
data(titanic_train)

#Loading dataset and performing logistic regression
lr<-glm(Survived ~ Pclass + Age + SibSp + Parch, data= titanic_train, family=binomial(link="logit"))
summary(lr)

#Plotting the ROC Curve (True Positive Rate vs False Positive Rate)
da=as.data.frame(titanic_train[,c("Pclass","Age","SibSp","Parch")])
pred<-predict(lr, da, type="response")
predObj<-prediction(pred, titanic_train$Survived)
rocObj<-performance(predObj, measure="tpr",x.measure="fpr")
plot(rocObj, main="ROC Curve")