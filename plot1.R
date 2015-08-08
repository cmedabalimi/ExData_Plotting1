power <- read.table("c:/Users/Cyril/ExData_Plotting1/household_power_consumption.txt", header=T, sep=";")
#Date: Date in format dd/mm/yyyy
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
#Now bring in only the data between the dates that is required for this assignment
gData <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
#format the rst of the data
gData$Global_active_power <- as.numeric(as.character(gData$Global_active_power))
gData$Global_reactive_power <- as.numeric(as.character(gData$Global_reactive_power))
gData$Voltage <- as.numeric(as.character(gData$Voltage))
gData <- transform(gData, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
gData$Sub_metering_1 <- as.numeric(as.character(gData$Sub_metering_1))
gData$Sub_metering_2 <- as.numeric(as.character(gData$Sub_metering_2))
gData$Sub_metering_3 <- as.numeric(as.character(gData$Sub_metering_3))
#Global active power
plot1 <- function() {
  hist(gData$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("Plot1.png has been saved in", getwd())
}
plot1()