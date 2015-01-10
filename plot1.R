library(sqldf)
data<-read.csv.sql("exploratoryData/household_power_consumption.txt","select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
png(filename="plot1.png",width=480,height=480)
hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
rm("data")