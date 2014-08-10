# Scott Arendt
# Coursera - Exploratory Data Analysis Course Project 1

# This script produces 3 line plots of the submetering values from the Electric Power Consumption 
# dataset from the UC Irvine Machine Learning Repository.  The output is to a PNG file to store the
# resulting graph.

# Call DownloadPowerData.R script to load the PowerData dataframe.  It will download the data if
# necessary and read the data into PowerData.


source("DownloadPowerData.R")

# Set device to output to a graphics file, 480 by 480 pixels
png("plot3.png"
   , width = 480
    , height = 480
    , units = "px" )

plot(PowerData$Date
     , PowerData$Sub_metering_1
     , ylab = "Energy sub metering"
     , xlab = ""
     , type="l"
)

lines(PowerData$Date, PowerData$Sub_metering_2, type='l', col="red")

lines(PowerData$Date, PowerData$Sub_metering_3, type='l', col="blue")

legend("topright"
       , legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
       , col=c('black', 'red', 'blue', 'green',' brown')
       , lty=c(1,1,1)
       ) 

# Close the device to complete the plot
dev.off()
