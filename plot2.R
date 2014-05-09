# Set working directory
setwd("H:\\Coursera\\Data Science Track\\04_Exploratory Data Analysis\\week 1\\Assignment 1")

# Load data into R and data preparation
power <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
power$Date2 <- as.Date(power$Date, format = "%d/%m/%Y") # Convert to date
inDate <- as.Date(c("2007-02-01", "2007-02-02"))  # Only these 2 days are relevant
power <- power[power$Date2 %in% inDate , ] # Dataset contains only these 2 days

# Convert "?" to NA
power[power[ ,3]=="?", 3] <- NA
power[power[ ,4]=="?", 4] <- NA
power[power[ ,5]=="?", 5] <- NA
power[power[ ,6]=="?", 6] <- NA
power[power[ ,7]=="?", 7] <- NA
power[power[ ,8]=="?", 8] <- NA

# Convert to numeric
power[ ,3] <- as.numeric(power[ ,3])
power[ ,4] <- as.numeric(power[ ,4])
power[ ,5] <- as.numeric(power[ ,5])
power[ ,6] <- as.numeric(power[ ,6])
power[ ,7] <- as.numeric(power[ ,7])
power[ ,8] <- as.numeric(power[ ,8])

# Create date variable in POSIXlt format
power$DateAndTime <- paste(power$Date, power$Time, sep=" ")
power$DateAndTime <- strptime(power$DateAndTime, format='%d/%m/%Y %H:%M:%S')

############# Plot 2
# Open graphics device (default = 480 x 480 pixels)
png(file = "plot2.png")

plot(power[ ,11], power[ ,3], type="l", xlab="", 
     ylab="Global Active Power (kilowatts)", bg="transparent")

dev.off() # Close graphics device
