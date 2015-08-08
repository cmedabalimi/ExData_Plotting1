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
plot4 <- function() {
  #two rows and two columns. Will first fill in the first row and then the next
  par(mfrow=c(2,2))
  
  ##PLOT 1
  plot(gData$timestamp,gData$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  ##PLOT 2
  plot(gData$timestamp,gData$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##PLOT 3
  plot(gData$timestamp,gData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(gData$timestamp,gData$Sub_metering_2,col="red")
  lines(gData$timestamp,gData$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
  
  #PLOT 4
  plot(gData$timestamp,gData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  #OUTPUT
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  cat("plot4.png has been saved in", getwd())
}
plot4()
