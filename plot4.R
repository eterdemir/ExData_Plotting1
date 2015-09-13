mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

mydata$DateTime <- paste(mydata$Date, mydata$Time)

mydata$DateTime <- strptime(mydata$DateTime, "%d/%m/%Y %H:%M:%S")

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

mydata.sub <- subset(mydata, Date == "2007-02-01" | Date == "2007-02-02")

#Change data formats for plots to work
mydata.sub$Global_active_power <- as.numeric(levels(mydata.sub$Global_active_power)[mydata.sub$Global_active_power])
mydata.sub$Voltage <- as.numeric(levels(mydata.sub$Voltage)[mydata.sub$Voltage])
mydata.sub$Sub_metering_1 <- as.numeric(levels(mydata.sub$Sub_metering_1)[mydata.sub$Sub_metering_1])
mydata.sub$Sub_metering_2 <- as.numeric(levels(mydata.sub$Sub_metering_2)[mydata.sub$Sub_metering_2])
mydata.sub$Global_reactive_power <- as.numeric(levels(mydata.sub$Global_reactive_power)[mydata.sub$Global_reactive_power])


png(file = "plot4.png", width = 480, height = 480)

#Prepare plotting screen for 4 plots
par(mfrow = c(2,2))

  #row1 first plot
plot(mydata.sub$DateTime, mydata.sub$Global_active_power, xlab = "", ylab = "Global Active Power", pch = "")
lines(mydata.sub$DateTime, mydata.sub$Global_active_power, pch = "")

  #row1 second plot
plot(mydata.sub$DateTime, mydata.sub$Voltage, xlab = "datetime", ylab = "Voltage", pch = "")
lines(mydata.sub$DateTime, mydata.sub$Voltage, pch = "")

  #row2 first plot
plot(mydata.sub$DateTime, mydata.sub$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n", pch = "")
lines(mydata.sub$DateTime, mydata.sub$Sub_metering_1)
lines(mydata.sub$DateTime, mydata.sub$Sub_metering_2, col = "red")
lines(mydata.sub$DateTime, mydata.sub$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = 'n',
       cex = 0.8)

  #row2 second plot
plot(mydata.sub$DateTime, mydata.sub$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", pch = "")
lines(mydata.sub$DateTime, mydata.sub$Global_reactive_power, pch = "")

dev.off()