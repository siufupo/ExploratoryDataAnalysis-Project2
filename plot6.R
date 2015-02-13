setwd("~/R/coursera/Exploratory")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$SCC<-as.factor(NEI$SCC)
NEI$type<-as.factor(NEI$type)
NEI$year<-as.factor(NEI$year)

library(plyr)
library(ggplot2)

# Q6
SCC_filter<-SCC[SCC$Data.Category=="Onroad",]
NEI_filter<-subset(NEI,(NEI$SCC %in% SCC_filter$SCC)&(fips %in% c("24510","06037")))

table<-ddply(NEI_filter,.(fips,year),summarise,sum=sum(Emissions))

png(file="plot6.png",width=550,height=480)
g<-ggplot(table,aes(year, sum))
g+geom_point(aes(color=fips),size=3)+geom_line(aes(group=fips,color=fips))+labs(y="Emissions (Tons)",title="PM2.5 Emissions motor vehicle L.A. vs Baltimore from 1999 to 2008")
dev.off()
