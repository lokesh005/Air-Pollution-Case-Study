install.packages("ggplot2")
library(ggplot2)

setwd("C:\\Users\\LOKESH TODWAL\\Downloads\\exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))


MD <- subset(NEI, fips == '24510' & type == 'ON-ROAD')

MD_n <- aggregate(MD[, 'Emissions'], by=list(MD$year), sum)
colnames(MD_n) <- c('year', 'Emissions')

png(filename='C:\\Users\\LOKESH TODWAL\\Downloads\\exdata_data_NEI_data\\plot5.png')

ggplot(data=MD_n, aes(x=year, y=Emissions)) + geom_point(aes(fill=year, col=year)) + geom_line(aes(group=1)) + ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City') + ylab(expression('PM'[2.5])) + xlab('Year')

dev.off()
