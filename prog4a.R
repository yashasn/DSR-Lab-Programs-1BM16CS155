library(ggplot2)
library(gcookbook)
cabbage_exp
ggplot(cabbage_exp,aes(x=Date,y=Weight,fill=Cultivar))+geom_bar(stat="identity",position = "dodge")+ geom_text(aes(label=Weight),vjust=10.0,colour="white",position = position_dodge(1.0),size=3)
