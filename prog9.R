#Naive Bayes Classification Manually
df<-read.csv("D:/1. Yashas' Documents/BMSCE/4th Year/DSR/Lab Programs/nb_data.csv")
#Probability of each class
probClass<-table(df$Enrolls)
probClass<-probClass/sum(probClass)
probClass
#Probabilities of Attribute Age
ageClass<-table(df$Enrolls,df$Age)
ageClass<-ageClass/rowSums(ageClass)
ageClass
#Probabilities of Attribute Income
incomeClass<-table(df$Enrolls,df$Income)
incomeClass<-incomeClass/rowSums(incomeClass)
incomeClass
#Probabilities of Attribute JobSatis
jobClass<-table(df$Enrolls,df$JobSatis)
jobClass<-jobClass/rowSums(jobClass)
jobClass
#Probabilities of Attribute Desire
desireClass<-table(df$Enrolls,df$Desire)
desireClass<-desireClass/rowSums(desireClass)
desireClass
Age<-"<=30"
Income<-"Medium"
JobSatis<-"Yes"
Desire<-"Fair"
test<-data.frame(Age,Income,JobSatis,Desire)
#Compute probabilities of Yes and No classes for test data
prob_yes=probClass["Yes"]*(ageClass["Yes",Age]*incomeClass["Yes",Income]*jobClass["Yes",JobSatis]*desireClass["Yes",Desire])
prob_no=probClass["No"]*(ageClass["No",Age]*incomeClass["No",Income]*jobClass["No",JobSatis]*desireClass["No",Desire])
prob_yes
prob_no

#Naive Bayes Classifer Function
library(e1071)
nb<-naiveBayes(Enrolls~ Age+ Income + JobSatis + Desire, data=df)
nb
predict(nb,test)