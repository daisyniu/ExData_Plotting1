#read to dataframe
datafile<- read.csv("household_power_consumption.txt",sep = ";", na.strings = "?")


datafile$Date <- as.Date(datafile$Date, format = "%d/%m/%Y")

sub_data <- subset(datafile, Date >= "2007-02-01" & Date <= "2007-02-02")


#strptime date and time
sub_data$date_time <- strptime(paste(sub_data$Date, sub_data$Time), "%Y-%m-%d %H:%M:%S")

#Plot 2
library(datasets)
with(sub_data,plot(date_time,Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.copy(png, file = "plot2.png", height = 480, width = 480)

dev.off()