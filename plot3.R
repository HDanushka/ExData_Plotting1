setwd("E:/Acedemic/4th year/1st semester/AS404/ExData_Plotting1")

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subData <- subset(data , Date %in% c("1/2/2007","2/2/2007"))
subData$Date <- as.Date(subData$Date, format="%d/%m/%Y")
dateTime <- paste(as.Date(subData$Date), subData$Time)
subData$DateTime <- as.POSIXct(dateTime)

#getting plot3
with(subData, {
    plot(Sub_metering_1~DateTime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~DateTime,col='Red')
    lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
