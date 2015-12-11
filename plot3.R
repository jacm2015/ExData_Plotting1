
# Exploratory Data Analysis. Project.1.  Plot3
# R version 3.2.2 (2015-08-14) -- "Fire Safety"

# Set working directory
setwd("~/MisApuntes/Estadistica/DAtaScienceCourse/4_exploratoryAnalysis/Project_1")
rm(list=ls()) # remove objects

library(lubridate)
library(dplyr)
Sys.setlocale("LC_ALL", "C") # US setting for graphic labels

# Read Data from the file.
hpc <- read.csv("./household_power_consumption.txt", 
       header=TRUE, sep=";", na.strings = "?",  stringsAsFactors=FALSE ) 

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
hpc <- hpc[hpc$Date=="1/2/2007" | hpc$Date == "2/2/2007", ]

# convert Date + Time to POSIXlt data as dateTime
hpc = mutate(hpc, dateTime =   paste(Date, Time, sep = " "))
hpc = mutate(hpc , dateTime = dmy_hms(dateTime))
                                      

#plot 3
par(mfrow = c(1, 1), mar = c(4, 4, 2, 2))
plot(hpc$dateTime, hpc$Sub_metering_1, type="l", col = "black",
     ylab = "Energy sub metering", xlab= "")

lines( hpc$dateTime, hpc$Sub_metering_2, col = "red")
lines(hpc$dateTime, hpc$Sub_metering_3, col = "blue")
legend ("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lty=1, col = c("black", "red", "blue"))

dev.copy(png, file = "plot3.png")   ## Copy plot to a PNG file
dev.off() 

