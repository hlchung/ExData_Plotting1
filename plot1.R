library(dplyr)
library(ggplot2)
library(lattice)

householddata <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, header = T, sep = ";", dec=".")

householddatasubset <- householddata[householddata$Date == '1/2/2007' | householddata$Date == '2/2/2007', ]

globalactivepower <- as.numeric(householddatasubset$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(globalactivepower, col = 'red', xlab = 'Global Active Power (kilowatts)', main = "Global Active Power")
dev.off()