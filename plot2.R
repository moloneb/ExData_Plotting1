household_power_consumption <- read.csv("household_power_consumption.txt", sep=";",na.strings = "?")
hpc <- household_power_consumption[household_power_consumption$Date=="1/2/2007"|household_power_consumption$Date=="2/2/2007",]
library(lubridate)
hpc$datetime_str <- paste(hpc$Date,hpc$Time)
hpc$datetime <- dmy_hms(hpc$datetime_str)

#plot 2
plot(hpc$datetime,hpc$Global_active_power, type="l", xlab= "", ylab= "Global Active Power (kilowatts)" )
dev.copy(png,file="plot2.png", width = 480, height = 480)
dev.off()
