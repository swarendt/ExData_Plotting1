# Scott Arendt
# Coursera - Exploratory Data Analysis Course Project 1

# This script will retrieve a file of Electric Power Consumption from the UC Irvine Machine Learning
# Repository.  The first call to this script will download and unzip the files.  Subsequent calls
# will only read the data into the dataframe


# Load the sqldf library for use on data manipulation
library(sqldf)

# If the zipped data file is not found locally, then download it.
# This script should work without regard to the directory in which it is run

ZippedDataFile <- "./data.zip"
ZippedDataLocation <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
DataFile <- "household_power_consumption.txt"

if (!file.exists(ZippedDataFile))
{
download.file(ZippedDataLocation, destfile = ZippedDataFile, mode = "wb")
}

# If the unzipped data file does not exist, unzip it
if (!file.exists(DataFile))
{
unzip("data.zip")
}

# Read in the data, limited to February 1st and 2nd, 2007
PowerData <- read.csv.sql("household_power_consumption.txt", "select * from file where date = '1/2/2007' OR date = '2/2/2007'", header = TRUE, sep = ';', 
                          colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
# Combine the date and time fields into a single field of POSIX type
PowerData$Date <- strptime(paste(PowerData$Date,PowerData$Time), "%d/%m/%Y %H:%M:%S")

on.exit(closeAllConnections())



