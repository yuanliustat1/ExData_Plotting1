setwd('/Users/yuanliu/Desktop/Data Science Track')
#read the data into R
data1=read.table('household_power_consumption.txt',header=T,sep=';',na.strings='?')
data1$Date=as.Date(data1$Date,'%d/%m/%Y')

#subsetting the data between 2007-02-01 to 2007-02-02
data2=subset(data1,data1$Date<=as.Date('2007-02-02')&data1$Date>=as.Date('2007-02-01'))


#datetime
data2$date_time=strptime(data2$Date,data2$Time,'%Y-%m-%d %H:%M:%S',tz='EST5EDT')
x=paste(data2$Date,data2$Time)
y=strptime(x,'%Y-%m-%d %H:%M:%S')

#plot4.png
png('plot4.png',width=480,height=480)
par(mfrow=c(2,2))
with(data2,{
  plot(y,data2$Global_active_power,type='l',xlab='',ylab='Global active power')
  plot(y,data2$Voltage,type='l',xlab='datetime',ylab='Voltage ')
  plot(y,data2$Sub_metering_1,type='l',col='black',ylab='Energy sub metering',xlab='')
  lines(y,data2$Sub_metering_2,col='red')
  lines(y,data2$Sub_metering_3,col='blue')
  legend('topright',col=c('black','red','blue'),
         legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
         lty=c(1,1,1),bty='n')
  plot(y,data2$Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power')
}
)
dev.off()

