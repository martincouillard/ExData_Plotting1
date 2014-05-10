setClass("myDate")
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
InClasses <- c("myDate", "character", "character", "character", "character", "character", "character", "character", "character")
InData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE, colClasses = InClasses)
sData <- subset(InData, (InData$Date == "2007-02-01") | (InData$Date == "2007-02-02"))

png("plot3.png")
plot(sData$Sub_metering_1,xaxt="n", type = "n", ylab = "Energy sub metering", xlab = "")
lines(sData$Sub_metering_1)
lines(sData$Sub_metering_2, col = "red")
lines(sData$Sub_metering_3, col = "blue")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", names(sData[,7:9]), lty = 1, col = c('black', 'red', 'blue'))


dev.off()