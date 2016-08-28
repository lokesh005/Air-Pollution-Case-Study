setwd("C:\\Users\\LOKESH TODWAL\\Downloads\\exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(NEI)

c1=subset(NEI, NEI$year==1999 )
c2=subset(NEI, NEI$year==2002)
c3=subset(NEI, NEI$year==2005)
c4=subset(NEI, NEI$year==2008)
with(c1, tapply(Emissions, year, sum))
total_em=rep(0,4)
y=rep(0,4)
y[1]=1999
y[2]=2002
y[3]=2005
y[4]=2008

total_em[1]=(sum(c1$Emissions)/1000)
total_em[2]=(sum(c2$Emissions)/1000)
total_em[3]=(sum(c3$Emissions)/1000)
total_em[4]=(sum(c4$Emissions)/1000)

k=data.frame(total_em=total_em, year=y)

png(filename='C:\\Users\\LOKESH TODWAL\\Downloads\\exdata_data_NEI_data\\plot1.png')
par(mar=c(4,4,2,1))
barplot(k$total_em, names.arg = k$y, xlab="Year", ylab=expression(paste('PM', ''[2.5], ' in Kilotons')), main =expression('Total Emission of PM'[2.5]))
dev.off()
