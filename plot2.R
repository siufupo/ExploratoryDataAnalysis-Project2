setwd("~/R/coursera/Exploratory")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$SCC<-as.factor(NEI$SCC)
NEI$type<-as.factor(NEI$type)
NEI$year<-as.factor(NEI$year)

library(plyr)
library(ggplot2)

# Q2
balti<-subset(NEI,fips=="24510")
sum<-with(balti,tapply(Emissions,year,sum))
png(file="plot2.png",width=480,height=480)
barplot(sum,col="lightgreen",main="Total PM2.5 Emissions in Baltimore City from 1999 to 2008",ylab="Total Emissions (Tons)")
dev.off()
