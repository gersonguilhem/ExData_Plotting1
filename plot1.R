#======================================================================
# plot1.R                                             
# Author: Gerson Guilhem                 
#                                                                   
# Description: This script will load the data Electric Power 
# Consumption dataset and generate the plot 1 as required by the
# Week 1 graded assingment from the Exploratory Data Analysis course.
#           
# This script assumes you have downloaded the Electric Power 
# Consumption dataset that it is unzipped in your current working
# directory.
#
# Outcome: the outcome of this script is a png file with the plot 
# described as plot1 in the assignment description.
#======================================================================

# Read dplyr library to perform some data manipulation in just a single chain of commands
library(dplyr)

# Read the data only for the required dates: Feb-1-2007 and Feb-2-2007
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE) %>% 
  filter(Date %in% c('1/2/2007','2/2/2007'))

# Call the png device to prepare it to recevied the plot1 data
png(filename = "plot1.png", width = 480, height = 480)

# Build plot1
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Close the graphics device in order to complete the plotting operation
dev.off()