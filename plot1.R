#Uses library sqldf
library(sqldf)
#load data using select command of sqldf, uses "where Date in" condition to filter two days data
data<-read.csv.sql("exploratoryData/household_power_consumption.txt","select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
#Create a new column DateTime concatenating the Date and Time column
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
#Creates a PNG Graphic Devices definition. PNG files are of size 480 X 480 pixels
png(filename="plot1.png",width=480,height=480)
#Plot using hist functio
hist(data$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
#wrire data to png file
dev.off()
rm("data")