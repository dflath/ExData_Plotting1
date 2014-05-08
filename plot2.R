setwd("/Users/flath/Google Drive/Coursera/DataScience/EDAProject1")
getwd()
frame1 <- read.delim("/Users/flath/Google Drive/Coursera/DataScience/EDAProject1/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?" , colClasses=rep("character", numcolumns) )
# table1 <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
firstDay <- frame1[with(frame1, Date == "1/2/2007"),]
secondDay <- frame1[with(frame1, Date == "2/2/2007"),]
goodData <- rbind(firstDay,secondDay)

power<-as.numeric(as.character(goodData$Global_active_power))

dates<-as.character(goodData$Date)
times <-as.character(goodData$Time)
datesAndTimes <- paste(dates, times, sep=" ")
goodTimes <-strptime(datesAndTimes, format="%d/%m/%Y %H:%M:%S")

png(filename ="plot2.png", width = 480, height = 480)
plot(goodTimes,power,xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()
        
