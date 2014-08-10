# Scott Arendt
# Coursera - Exploratory Data Analysis Course Project 1

# This script produces a histogram of the Global Active Power from the Electric Power Consumption 
# dataset from the UC Irvine Machine Learning Repository.  The output is to a PNG file to store the
# resulting graph.

# Call DownloadPowerData.R script to load the PowerData dataframe.  It will download the data if
# necessary and read the data into PowerData.

source("DownloadPowerData.R")

# Set device to output to a graphics file, 480 by 480 pixels
png("plot1.png"
    , width = 480
    , height = 480
    , units = "px", )

hist(PowerData$Global_active_power
     , main = paste("Global Active Power")
     , xlab = 'Global Active Power (kilowatts)'
     , col = "red"
     , xlim=c(0, 6)
     , ylim=c(0, 1200) 
     )
# y-axis definition
axis(side=2, at=seq(0, 1200, by = 200), labels=seq(0, 1200, 200))
# x-axis definition
axis(side=1, at=seq(0, 6, by = 2), labels=seq(0, 6, 2))

# Close the device to complete the plot
dev.off()
