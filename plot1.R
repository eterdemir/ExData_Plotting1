mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

mydata.sub <- subset(mydata, Date == "2007-02-01" | Date == "2007-02-02")

x <- as.numeric(levels(mydata.sub$Global_active_power)[mydata.sub$Global_active_power])

png(file = "plot1.png", width = 480, height = 480)
hist(x, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()