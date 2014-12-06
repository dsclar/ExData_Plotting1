#Explorartoty Data Analysis - Assignment I- Plot2
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


plot(hpc1$Date_Time, hpc1$Global_active_power, type = "l", 
     xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file= "Plot2.png")
dev.off()