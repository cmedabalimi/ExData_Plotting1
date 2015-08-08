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
plot3 <- function() {
  plot(gData$timestamp,gData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(gData$timestamp,gData$Sub_metering_2,col="red")
  lines(gData$timestamp,gData$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
  cat("plot3.png has been saved in", getwd())
}
plot3()
