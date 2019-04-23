library(dplyr)
library(ggplot2)
library(lattice)

householddata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, header = T, sep = ";", dec=".")
householddatasubset <- householddata[householddata$Date == '1/2/2007' | householddata$Date == '2/2/2007', ]

globalactivepower <- as.numeric(householddatasubset$Global_active_power)
datetime <- paste(householddatasubset$Date, householddatasubset$Time, sep = " ")
timeseries <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(timeseries, globalactivepower, xlab=" ", ylab = "Global Active Power (kilowatts)", type = 'l')
dev.off()
