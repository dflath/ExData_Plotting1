setwd("/Users/flath/Google Drive/Coursera/DataScience/EDAProject1")
getwd() 
numcolumns=9
frame1 <- read.delim("/Users/flath/Google Drive/Coursera/DataScience/EDAProject1/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?" , colClasses=rep("character", numcolumns) )
# table1 <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
firstDay <- frame1[with(frame1, Date == "1/2/2007"),]
secondDay <- frame1[with(frame1, Date == "2/2/2007"),]
goodData <- rbind(firstDay,secondDay)

submetering1<-as.numeric(as.character(goodData$Sub_metering_1))
submetering2<-as.numeric(as.character(goodData$Sub_metering_2))
submetering3<-as.numeric(as.character(goodData$Sub_metering_3))

dates<-as.character(goodData$Date)
times <-as.character(goodData$Time) 
datesAndTimes <- paste(dates, times, sep=" ")
goodTimes <-strptime(datesAndTimes, format="%d/%m/%Y %H:%M:%S")

png(filename ="plot3.png", width = 480, height = 480)
plot3.png<-plot(goodTimes,submetering1 ,xlab="", type="l", col="black", ylab="Energy sub metering")
lines(goodTimes,submetering2, col="red")
lines(goodTimes,submetering3, col="blue")
# par(new=TRUE)
# plot(goodTimes,submetering2 ,xlab="", ylab="", type="l", col="red", axes=FALSE, ylim=c(0,39))
# par(new=TRUE)
# plot(goodTimes,submetering3 ,xlab="", ylab= "", type="l", col="blue", ylim=c(0,39))
legend("topright", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()

