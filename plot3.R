#read to dataframe
datafile<- read.csv("household_power_consumption.txt",sep = ";", na.strings = "?")


datafile$Date <- as.Date(datafile$Date, format = "%d/%m/%Y")

sub_data <- subset(datafile, Date >= "2007-02-01" & Date <= "2007-02-02")


#strptime date and time
sub_data$date_time <- strptime(paste(sub_data$Date, sub_data$Time), "%Y-%m-%d %H:%M:%S")

#Plot 3
library(datasets)
with(sub_data,plot(date_time,Sub_metering_1,type = "l", ylab = "Energy sub metering", xlab = ""))
lines(sub_data$date_time,sub_data$Sub_metering_2, type = "l", col = "Red")
lines(sub_data$date_time,sub_data$Sub_metering_3, type = "l", col = "Blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

dev.copy(png, file = "plot3.png", height = 480, width = 480)

dev.off()