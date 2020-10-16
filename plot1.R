setwd("E:/Acedemic/4th year/1st semester/AS404/ExData_Plotting1")

data<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subData<- subset(data, Date %in% c("1/2/2007","2/2/2007"))
subData$Date <- as.Date(subData$Date, format="%d/%m/%Y")
hist(subData$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#getting the png file
png("plot1.png", width=480, height=480)
dev.off()
