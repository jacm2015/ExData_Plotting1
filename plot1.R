
# Exploratory Data Analysis. Project.1. Plot1
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
                                      
# plot 1
par(mfrow = c(1, 1), mar = c(4, 4, 2, 2))
with(hpc, hist(Global_active_power,  col= "red"
     ,  main ="Global Active Power", 
     xlab = "Global Active Power (kilowatts)"))

dev.copy(png, file = "plot1.png")   ## Copy plot to a PNG file
dev.off()                           ## Close the PNG device!

