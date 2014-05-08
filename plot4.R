setwd("/Users/flath/Google Drive/Coursera/DataScience/EDAProject1")
getwd()
frame1 <- read.delim("/Users/flath/Google Drive/Coursera/DataScience/EDAProject1/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?" , colClasses=rep("character", numcolumns) )
# table1 <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
firstDay <- frame1[with(frame1, Date == "1/2/2007"),]
secondDay <- frame1[with(frame1, Date == "2/2/2007"),]
goodData <- rbind(firstDay,secondDay)

power<-as.numeric(as.character(goodData$Global_active_power))
powerReact<-as.numeric(as.character(goodData$Global_reactive_power))
voltage <- as.numeric(as.character(goodData$Voltage))

submetering1<-as.numeric(as.character(goodData$Sub_metering_1))
submetering2<-as.numeric(as.character(goodData$Sub_metering_2))
submetering3<-as.numeric(as.character(goodData$Sub_metering_3))

dates<-as.character(goodData$Date)
times <-as.character(goodData$Time)
datesAndTimes <- paste(dates, times, sep=" ")
goodTimes <-strptime(datesAndTimes, format="%d/%m/%Y %H:%M:%S")

png(filename ="plot4a.png", width = 480, height = 480)
plot(goodTimes,powerReact,xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()

png(filename ="plot4b.png", width = 480, height = 480)
plot(goodTimes,voltage,xlab="datetime", ylab="Voltage", type="l")
dev.off()


png(filename ="plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(goodTimes,power,xlab="", ylab="Global Active Power", type="l")
plot(goodTimes,voltage,xlab="datetime", ylab="Voltage", type="l")
plot(goodTimes,submetering1 ,xlab="", type="l", col="black", ylab="Energy sub metering")
lines(goodTimes,submetering2, col="red")
lines(goodTimes,submetering3, col="blue")
legend("topright", lwd=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(goodTimes,powerReact,xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()