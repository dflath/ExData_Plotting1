setwd("/Users/flath/Google Drive/Coursera/DataScience/EDAProject1")
getwd()
frameframe1 <- read.delim("/Users/flath/Google Drive/Coursera/DataScience/EDAProject1/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?" , colClasses=rep("character", numcolumns) )
# table1 <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
firstDay <- frame1[with(frame1, Date == "1/2/2007"),]
secondDay <- frame1[with(frame1, Date == "2/2/2007"),]
goodData <- rbind(firstDay,secondDay)

png(filename ="plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(goodData$Global_active_power)), col='red', xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

