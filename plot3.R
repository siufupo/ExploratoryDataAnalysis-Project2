setwd("~/R/coursera/Exploratory")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$SCC<-as.factor(NEI$SCC)
NEI$type<-as.factor(NEI$type)
NEI$year<-as.factor(NEI$year)

library(plyr)
library(ggplot2)

# q3
balti<-subset(NEI,fips=="24510")
table<-ddply(balti,.(type,year),summarise,sum=sum(Emissions))
png(file="plot3.png",width=480,height=480)
g<-ggplot(table,aes(year, sum))
g+geom_point(aes(color=type),size=3)+geom_line(aes(group=type,color=type))+facet_grid(type~.,scales="free")+labs(y="Emissions (Tons)",title="PM2.5 Emissions by Type in Baltimore City from 1999 to 2008")
dev.off()
