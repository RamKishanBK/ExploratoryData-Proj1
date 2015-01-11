#Uses library sqldf
library(sqldf)
#load data using select command of sqldf, uses "where Date in" condition to filter two days data
data<-read.csv.sql("exploratoryData/household_power_consumption.txt","select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
#Create a new column DateTime concatenating the Date and Time column
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
#Creates a PNG Graphic Devices definition. PNG files are of size 480 X 480 pixels
png(filename="plot4.png",width=480,height=480)
#Creates a canvas which can take 4 plots(2 rows and 2 columns)
par(mfrow=c(2,2))
#Creates a margin 
par(mar=c(4,4,2,2))
#Plots the four graphs in the canvas
plot(data$DateTime,data$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(data$DateTime,data$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(data$DateTime,data$Sub_metering_2,type="l",col="red")
lines(data$DateTime,data$Sub_metering_3,type="l",col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty=1, col=c('black', 'red', 'blue'),cex=0.6)
plot(data$DateTime,data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
#Writes data to PNG file
dev.off()
rm("data")