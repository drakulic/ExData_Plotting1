require(sqldf)
myfile <- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv2.sql(myfile,mySql)
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")
DataTime <- paste(myData$Date, myData$Time)
dateDT <- as.POSIXct(strptime(DataTime, "%Y-%m-%d %H:%M:%S"))

par(mfrow = c(1,1))
png(file = "plot1.png", bg = "transparent")
hist(myData$Global_active_power, col = "red", main = c("Global Active Power"),
     xlab = "Global Active Power (kilowatts)")
dev.off()
