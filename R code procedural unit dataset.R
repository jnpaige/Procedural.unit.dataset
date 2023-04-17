library(ggplot2)
library(here)

setwd(paste(here::here(),"/Dataset/", sep=""))

# Isolate only rows where single reduction sequences were coded and only archaeological assemblages
data<-read.csv("procedural units obfus.csv")
data<-data[which(data$Single.Chain=="Yes"),]
data<-data[which(data$Arch==1),]

size<-22

tiff(file=paste(here::here(),"/Age_distribution.tiff", sep=""), width=15, height=10, units="in", res=250)

density.plot<-ggplot(data, aes(x=((KA.young+KA.old)/2)/1000)) + 
  geom_histogram(fill="gray",color="black", bins=20)  +
  labs(y="Frequency", 
       x="Age (mya)")  +
  scale_x_reverse() +
  theme_bw()+ 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.text=element_text(size=size),
        axis.title=element_text(size=size+2))  
density.plot

dev.off()

