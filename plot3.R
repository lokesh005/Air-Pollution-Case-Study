install.packages("ggplot2")
library(ggplot2)

setwd("C:\\Users\\LOKESH TODWAL\\Downloads\\exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$type=as.factor(NEI$type)
NEI <- subset(NEI, NEI$fips=="24510")


png(filename='C:\\Users\\LOKESH TODWAL\\Downloads\\exdata_data_NEI_data\\plot3.png')
ggplot(NEI, aes(x=factor(year),y=log(Emissions)))+ facet_grid(.~type) + geom_boxplot(aes(fill=type))
dev.off()
