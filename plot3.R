mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

mydata$DateTime <- paste(mydata$Date, mydata$Time)

mydata$DateTime <- strptime(mydata$DateTime, "%d/%m/%Y %H:%M:%S")

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

mydata.sub <- subset(mydata, Date == "2007-02-01" | Date == "2007-02-02")

mydata.sub$Sub_metering_1 <- as.numeric(levels(mydata.sub$Sub_metering_1)[mydata.sub$Sub_metering_1])
mydata.sub$Sub_metering_2 <- as.numeric(levels(mydata.sub$Sub_metering_2)[mydata.sub$Sub_metering_2])

plot(mydata.sub$DateTime, mydata.sub$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n", pch = "")
lines(mydata.sub$DateTime, mydata.sub$Sub_metering_1)
lines(mydata.sub$DateTime, mydata.sub$Sub_metering_2, col = "red")
lines(mydata.sub$DateTime, mydata.sub$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))