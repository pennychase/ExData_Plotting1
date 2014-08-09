# Set working directory
setwd("~/Documents/MOOCs/Data Science Specialization/Course4_Exploratory-Data-Analysis/Projects/ExData_Plotting1")

# Source readData.R -- contains the readData() function to download the data and read it into a data frame
source("./readData.R")

# Read the data and create a data frame of the observations from 2007-02-01 and 2007-02-02
powerConsumption <- readData("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

# Open png device (Plot1.png)
png(file="Plot1.png", width=480, height=480)

# Save the graphic parameters so we can restore them later
oldpar <- par()

# Change the text size to 75% of the default so the axis labels are the right size
par(cex=0.75)

# Plot the histogram, setting the title and the label for the x-axis
with(powerConsumption, hist(Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="red"))

# Restore the old graphic parametes
par(oldpar)

# Close png device
dev.off()
