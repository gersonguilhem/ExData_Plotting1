#======================================================================
# plot2.R
# Author: Gerson Guilhem
#                                            
# Description: This script will load the data Electric Power
# Consumption dataset and generate the plot 2 as required by the
# Week 1 graded assingment from the Exploratory Data Analysis course.
#
# This script assumes you have downloaded the Electric Power
# Consumption dataset that it is unzipped in your current working
# directory.
#
# Outcome: the outcome of this script is a png file with the plot
# described as plot2 in the assignment description.
#======================================================================

# Read dplyr library to perform some data manipulation in just a single chain of commands
library(dplyr)

# Read the data only for the required dates: Feb-1-2007 and Feb-2-2007
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE) %>% 
  filter(Date %in% c('1/2/2007','2/2/2007'))

# Creating a datetime column 
# First a new column "DateTime" is created containing the values of columns 'Date' and 'Time' separated 
# by a single space. This will build a single string containing the date and time of the measurements.
data <- data %>%
  mutate(DateTime = paste(as.character(Date), as.character(Time), sep = " "))

# This column can now be used with the function 'strptime' to convert it to a datetime object, in POSIXct format.
data$DateTime <- as.POSIXct(strptime(x = data$DateTime, format = "%d/%m/%Y %H:%M:%S"))

# Call the png device to prepare it to recevied the plot2 data
png(filename = "plot2.png", width = 480, height = 480)

# Build plot2
plot(data$Global_active_power ~ data$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Close the graphics device in order to complete the plotting operation
dev.off()