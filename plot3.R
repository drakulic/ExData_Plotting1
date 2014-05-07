mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv2.sql(myfile,mySql)
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")
DataTime <- paste(myData$Date, myData$Time)
dateDT <- as.POSIXct(strptime(DataTime, "%Y-%m-%d %H:%M:%S"))

par(mfrow = c(1,1))
png(file = "plot3.png", bg = "transparent")
plot(dateDT, myData$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")
points(dateDT, myData$Sub_metering_1, type = "l")
points(dateDT, myData$Sub_metering_2, type = "l", col = "red")
points(dateDT, myData$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1 , yjust = 1, col = c("black", "blue", "red"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()