setwd('/Users/yuanliu/Desktop/Data Science Track')
#read the data into R
data1=read.table('household_power_consumption.txt',header=T,sep=';',na.strings='?')
data1$Date=as.Date(data1$Date,'%d/%m/%Y')

#subsetting the data between 2007-02-01 to 2007-02-02
data2=subset(data1,data1$Date<=as.Date('2007-02-02')&data1$Date>=as.Date('2007-02-01'))

#plot1.png
png('plot1.png',width=480,height=480)
with(data2,hist(as.numeric(Global_active_power),xlab='Global Active Power(kilowatts)',col='red',main='Global Active Power'))
dev.off()