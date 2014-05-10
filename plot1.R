

setClass("myDate")
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
InClasses <- c("myDate", "character", "character", "character", "character", "character", "character", "character", "character")
InData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE, colClasses = InClasses)
sData <- subset(InData, (InData$Date == "2007-02-01") | (InData$Date == "2007-02-02"))

png("plot1.png")
with(sData,hist(as.numeric(Global_active_power), 
                 col="red", 20, 
                 main = "Global Active Power", 
                 xlab = "Global Active Power (kilowatts)", 
                 ylab = "Frequency", 
                
                xaxp = c(0,6,3)))
dev.off()
