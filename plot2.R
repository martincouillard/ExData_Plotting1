setClass("myDate")
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
InClasses <- c("myDate", "character", "character", "character", "character", "character", "character", "character", "character")
InData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE, colClasses = InClasses)
sData <- subset(InData, (InData$Date == "2007-02-01") | (InData$Date == "2007-02-02"))

png("plot2.png")
plot(sData$Global_active_power,xaxt="n", type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(sData$Global_active_power)
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))


dev.off()