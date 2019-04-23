library(dplyr)
library(ggplot2)
library(lattice)

householddata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, header = T, sep = ";", dec=".")
householddatasubset <- householddata[householddata$Date == '1/2/2007' | householddata$Date == '2/2/2007', ]

globalactivepower <- as.numeric(householddatasubset$Global_active_power)
voltage <- as.numeric(householddatasubset$Voltage)
submeter1 <- as.numeric(householddatasubset$Sub_metering_1)
submeter2 <- as.numeric(householddatasubset$Sub_metering_2)
submeter3 <- as.numeric(householddatasubset$Sub_metering_3)
globalreactivepower <- as.numeric(householddatasubset$Global_reactive_power)
datetime <- paste(householddatasubset$Date, householddatasubset$Time, sep = " ")
timeseries <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")


png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(timeseries, globalactivepower, type = 'l', ylab = 'Global Active Power', xlab = '')

plot(timeseries, voltage, type = 'l', ylab = 'Voltage', xlab = 'datetime')

plot(timeseries, submeter1, type = 'l', ylab = "Energy sub metering", xlab = "")
lines(timeseries, submeter2, col = 'red')
lines(timeseries, submeter3, col = 'blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, bty='n', col=c('black', 'red', 'blue'))

plot(timeseries, globalreactivepower, type = 'l', ylab = 'Global_reactive_power', xlab = 'datetime')

dev.off()
