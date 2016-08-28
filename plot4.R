install.packages("ggplot2")
library(ggplot2)

setwd("C:\\Users\\LOKESH TODWAL\\Downloads\\exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')

png(filename='C:\\Users\\LOKESH TODWAL\\Downloads\\exdata_data_NEI_data\\plot4.png')
ggplot(data=merge.sum, aes(x=Year, y=Emissions)) + geom_line(aes(group=1)) + geom_point(aes(size=2, col=Emissions)) + 
  ggtitle(expression('Total Emissions of PM'[2.5])) + 
  ylab(expression(paste('PM', ''[2.5], ' in kilotons')))
dev.off()