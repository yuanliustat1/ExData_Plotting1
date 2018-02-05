setwd('/Users/yuanliu/Desktop/Data Science Track')
#read the data into R
data1=read.table('household_power_consumption.txt',header=T,sep=';',na.strings='?')
data1$Date=as.Date(data1$Date,'%d/%m/%Y')

#subsetting the data between 2007-02-01 to 2007-02-02
data2=subset(data1,data1$Date<=as.Date('2007-02-02')&data1$Date>=as.Date('2007-02-01'))

#date time
x=paste(data2$Date,data2$Time)
y=strptime(x,'%Y-%m-%d %H:%M:%S')
#plot2
png('plot2.png',width=480,height=480)
plot(y,data2$Global_active_power,type='l',xlab='',ylab='Global Active Power(kilowatts)')
dev.off()