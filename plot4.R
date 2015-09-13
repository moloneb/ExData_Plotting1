household_power_consumption <- read.csv("household_power_consumption.txt", sep=";",na.strings = "?")
hpc <- household_power_consumption[household_power_consumption$Date=="1/2/2007"|household_power_consumption$Date=="2/2/2007",]
library(lubridate)
hpc$datetime_str <- paste(hpc$Date,hpc$Time)
hpc$datetime <- dmy_hms(hpc$datetime_str)


#plot 4
par(mfrow=c(2,2))
#subplot 1
plot(hpc$datetime,hpc$Global_active_power, type="l", xlab= "", ylab= "Global Active Power (kilowatts)" )
#subplot 2
plot(hpc$datetime, hpc$Voltage, type="l", xlab= "datetime", ylab= "Voltage" )
#subplot 3
with(hpc, plot(datetime,Sub_metering_1, type = "n",xlab = "",ylab="Energy sub metering"))
with(hpc,lines(datetime,Sub_metering_1, type="l", col ="black"))
with(hpc,lines(datetime,Sub_metering_2, type="l", col ="red"))
with(hpc,lines(datetime,Sub_metering_3, type="l", col ="blue"))
legend("topright",pch="_",cex=0.5,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#subplot 4
plot(hpc$datetime, hpc$Global_reactive_power, type="l", xlab= "datetime", ylab= "Global_reactive_power")
dev.copy(png,file="plot4.png", width = 480, height = 480)
dev.off()
