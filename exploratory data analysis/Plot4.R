# Scott Arendt
# Coursera - Exploratory Data Analysis Course Project 1

# This script produces a histogram of the Global Active Power from the Electric Power Consumption 
# dataset from the UC Irvine Machine Learning Repository.  The output is to a PNG file to store the
# resulting graph.

# Call DownloadPowerData.R script to load the PowerData dataframe.  It will download the data if
# necessary and read the data into PowerData.


source("DownloadPowerData.R")

# Set device to output to a graphics file, 480 by 480 pixels
png("plot4.png"  
    , width = 480    
    , height = 480    
    , units = "px" )

# Set the number and ordering of the plots
par(mfrow = c(2,2))

# Create the first plot, basically the same as the plot 1 task.
plot(PowerData$Date
     , PowerData$Global_active_power
     , ylab = "Global Active Power"
     , xlab = ""
     , ylim=c(0, 8)
     , type="l"
)

# Create the second plot, a line plot of voltage
plot(PowerData$Date
     , PowerData$Voltage
     , ylab = "Voltage"
     , xlab = "datetime"
     , type="l"
)

# Create the third plot, same as the multi line plot in the third assignment, but remove the 
# around the legend
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
       , bty='n'
) 

# Create the final plot, a line plot of the global reactive power
plot(PowerData$Date
     , PowerData$Global_reactive_power
     , ylab = 'Global_reactive_power'
     , xlab = 'datetime'
     , type = 'l'
)


# Close the device to complete the plot
dev.off()
