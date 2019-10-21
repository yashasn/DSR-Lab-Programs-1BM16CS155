library(ggplot2)
library(cluster)
library(graphics)

#Loading and performing K means clustering on dataset
df=as.data.frame(read.csv("C:/Users/yasha/Desktop/Yashas_P_DSR/data6.csv"))
df
mat=as.matrix(na.exclude(df[,1:6]))
mat
wss<-numeric(15)
for(k in 1:15) 
  wss[k]<-sum(kmeans(mat,centers=k,nstart=25)$withinss)
plot(1:15,wss,type="b",main="Plot of k vs WSS metric", xlab="Number of clusters", ylab="Within Sum of Squares Metric")
km<-kmeans(mat,centers=3,nstart=25)
km$centers

#Plotting any two dimensions (variables) of all data points and cluster centers
da=as.data.frame(na.exclude(df[,1:6]))
centers<-as.data.frame(km$centers[,1:2])
da$cluster=factor(km$cluster)
da
g1=ggplot(data=da, aes(x=da$mpg, y=da$cylinders, color=da$cluster)) + geom_point() + theme(legend.position="right") +
  geom_point(data=centers, aes(x=centers$mpg, y=centers$cylinders, color=as.factor(c(1,2,3))), size=10, alpha=0.3, show.legend=FALSE)
ggplot_build(g1)
