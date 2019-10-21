library(rpart)
library(rpart.plot)

#Loading dataset and constructing decision tree
df=read.csv("C:/Users/yasha/Desktop/Yashas_P_DSR/decision_data.csv")
summary(df)
dec_tree<-rpart(Play~Outlook + Temperature + Humidity + Wind, method="class", data=df, control=rpart.control(minsplit=1), parms=list(split='information'))
summary(dec_tree)


#Plotting decision tree
rpart.plot(dec_tree, type=4, extra=1)

#Predicting value of new test data
Outlook<-"sunny"
Temperature<-"mild"
Humidity<-"normal"
Wind<-FALSE
test<-data.frame(Outlook, Temperature, Humidity, Wind)
predict(dec_tree, test, type="class")
