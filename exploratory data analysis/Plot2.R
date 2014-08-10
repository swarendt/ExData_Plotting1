# Scott Arendt
# Coursera - Exploratory Data Analysis Course Project 1

# This script produces a line plot of the Global Active Power from the Electric Power Consumption 
# dataset from the UC Irvine Machine Learning Repository.  The output is to a PNG file to store the
# resulting graph.

# Call DownloadPowerData.R script to load the PowerData dataframe.  It will download the data if
# necessary and read the data into PowerData.




source("DownloadPowerData.R")

# Set device to output to a graphics file, 480 by 480 pixels
png("plot2.png"
    , width = 480
    , height = 480
    , units = "px" )

plot(PowerData$Date
      , PowerData$Global_active_power
     , ylab = "Global Active Power (kilowatts)"
     , xlab = ""
     , ylim=c(0, 8)
     , type="l"
)
# x-axis definition
axis(side=2, at=seq(0, 6, by = 2), labels=seq(0, 6, 2))

# Close the device to complete the plot
dev.off()
