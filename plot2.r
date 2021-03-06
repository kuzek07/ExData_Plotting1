##getting dataset
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##subsetting the data
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##converting dates and times
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##convert column
globalActivePower <- as.numeric(subSetData$Global_active_power)

##plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)" )

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
