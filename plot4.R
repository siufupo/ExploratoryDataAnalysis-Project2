setwd("~/R/coursera/Exploratory")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$SCC<-as.factor(NEI$SCC)
NEI$type<-as.factor(NEI$type)
NEI$year<-as.factor(NEI$year)

library(plyr)
library(ggplot2)

# Q4
SCC_filter<-SCC[grepl("([Cc]oal.*[Cc]ombustion)|([Cc]ombustion.*[Cc]oal)",SCC$Short.Name),]
NEI_filter<-NEI[NEI$SCC %in% SCC_filter$SCC,]
sum<-with(NEI_filter,tapply(Emissions,year,sum))
png(file="plot4.png",width=550,height=480)
barplot(sum,col="lightgreen",main="Total PM2.5 Emissions coal combustion-related in the US from 1999 to 2008",ylab="Total Emissions (Tons)")
dev.off()
