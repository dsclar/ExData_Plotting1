#Explorartoty Data Analysis - Assignment I- Plot3
setwd("C:/Users/Anne-Catherine/Documents/Exploratory Data Anlysis/exdata-data-household_power_consumption")

library(dplyr)
library(lubridate)
library(data.table)
hpc=read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
str(hpc)
hpc1=filter(hpc, Date=="1/2/2007" | Date=="2/2/2007")
hpc1=as.data.table(hpc1)
hpc1=hpc1[, Date_Time:=dmy_hms(paste(Date, Time, sep=" "))]
head(hpc1)

png(filename = "Plot4.png", width= 480, height=480)

par(mfcol=c(2,2), mar=c(4, 4, 3, 2), oma = c(2,0,0,0))
with(hpc1, {
plot(hpc1$Date_Time, hpc1$Global_active_power, type = "l", 
         xlab="", ylab="Global Active Power") 

plot(hpc1$Date_Time, hpc1$Sub_metering_1, type = "n", 
     xlab="", ylab="Energy sub metering")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, bty= "n")
lines(hpc1$Date_Time, hpc1$Sub_metering_1, type = "l", col="black")
lines(hpc1$Date_Time, hpc1$Sub_metering_2, type = "l", col="red")
lines(hpc1$Date_Time, hpc1$Sub_metering_3, type = "l", col="blue")



plot(hpc1$Date_Time, hpc1$Voltage, type = "l", 
     xlab="datetime", ylab="Voltage")

plot(hpc1$Date_Time, hpc1$Global_reactive_power, type = "l", 
     xlab="datetime", ylab="Global_reactive_power")


})
  
dev.off()