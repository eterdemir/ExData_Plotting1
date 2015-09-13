mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

mydata$DateTime <- paste(mydata$Date, mydata$Time)

mydata$DateTime <- strptime(mydata$DateTime, "%d/%m/%Y %H:%M:%S")

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

mydata.sub <- subset(mydata, Date == "2007-02-01" | Date == "2007-02-02")

mydata.sub$Global_active_power <- as.numeric(levels(mydata.sub$Global_active_power)[mydata.sub$Global_active_power])

png(file = "plot2.png", width = 480, height = 480)
plot(mydata.sub$DateTime, mydata.sub$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", pch = "")
lines(mydata.sub$DateTime, mydata.sub$Global_active_power, pch = "")
dev.off()
