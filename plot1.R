setwd("~/R/coursera/Exploratory")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$SCC<-as.factor(NEI$SCC)
NEI$type<-as.factor(NEI$type)
NEI$year<-as.factor(NEI$year)

library(plyr)
library(ggplot2)

# Q1
sum<-with(NEI,tapply(Emissions,year,sum))
png(file="plot1.png",width=480,height=480)
barplot(sum/1000000,col="lightgreen",main="Total PM2.5 Emissions in the US from 1999 to 2008",ylab="Total Emissions (Million Tons)")
dev.off()
