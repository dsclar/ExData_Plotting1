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

png(filename = "Plot3.png", width= 480, height=480)
plot(hpc1$Date_Time, hpc1$Sub_metering_1, type = "n", 
     xlab="", ylab="Energy sub metering")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)
lines(hpc1$Date_Time, hpc1$Sub_metering_1, type = "l", col="black")
lines(hpc1$Date_Time, hpc1$Sub_metering_2, type = "l", col="red")
lines(hpc1$Date_Time, hpc1$Sub_metering_3, type = "l", col="blue")
  
dev.off()