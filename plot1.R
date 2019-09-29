#read to dataframe
datafile<- read.csv("household_power_consumption.txt",sep = ";", na.strings = "?")


datafile$Date <- as.Date(datafile$Date, format = "%d/%m/%Y")

sub_data <- subset(datafile, Date >= "2007-02-01" & Date <= "2007-02-02")


#Plot 1

hist(sub_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")


#constrcut each plot into .png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)

dev.off()