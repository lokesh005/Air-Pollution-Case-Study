setwd("C:\\Users\\LOKESH TODWAL\\Downloads\\exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

d <- subset(NEI, NEI$fips=="24510")

arr=with(d, tapply(d$Emissions, d$year, sum))

y=c(arr[[1]], arr[[2]], arr[[3]], arr[[4]])
y=as.matrix(y)
x=c(1999,2002,2005,2008)
x=as.matrix(x)

new_data= data.frame(pm=y, year=x)

png(filename='C:\\Users\\LOKESH TODWAL\\Downloads\\exdata_data_NEI_data\\plot2.png')
par(mar=c(4,4,2,1))
barplot(new_data$pm, names.arg=new_data$year, xlab="Year", ylab=expression(paste('PM', ''[2.5], ' in Kilotons')), main ='Total Emission in Baltimore City, MD')
dev.off()