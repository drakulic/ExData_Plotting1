mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv2.sql(myfile,mySql)
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")
DataTime <- paste(myData$Date, myData$Time)
dateDT <- as.POSIXct(strptime(DataTime, "%Y-%m-%d %H:%M:%S"))

png(file = "plot4.png", bg = "transparent")
par(mfrow = c(2, 2))
plot(dateDT, myData$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power")
plot(myData$Voltage ~ dateDT, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dateDT, myData$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")
points(dateDT, myData$Sub_metering_1, type = "l")
points(dateDT, myData$Sub_metering_2, type = "l", col = "red")
points(dateDT, myData$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1 , bty = "n", yjust = 1,
       col = c("black", "blue", "red"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
plot(myData$Global_reactive_power ~ dateDT, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()