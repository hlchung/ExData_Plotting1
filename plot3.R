library(dplyr)
library(ggplot2)
library(lattice)

householddata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, header = T, sep = ";", dec=".")
householddatasubset <- householddata[householddata$Date == '1/2/2007' | householddata$Date == '2/2/2007', ]

submeter1 <- as.numeric(householddatasubset$Sub_metering_1)
submeter2 <- as.numeric(householddatasubset$Sub_metering_2)
submeter3 <- as.numeric(householddatasubset$Sub_metering_3)
datetime <- paste(householddatasubset$Date, householddatasubset$Time, sep = " ")
timeseries <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480, units = "px")
plot(timeseries, submeter1, type = 'l', ylab = "Energy sub metering", xlab = "")
lines(timeseries, submeter2, col = 'red')
lines(timeseries, submeter3, col = 'blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c('black', 'red', 'blue'))
dev.off()