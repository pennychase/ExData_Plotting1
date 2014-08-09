# Source readData.R -- contains the readData() function to download the data and read it into a data frame
source("./readData.R")

# Read the data and create a data frame of the observations from 2007-02-01 and 2007-02-02
powerConsumption <- readData("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

# Open png device (Plot2.png)
png(file="Plot2.png", widht=480, height=480)

# Save the old graphic parameters
oldpar <- par()

# Change the text size to 75% of the default
par(cex=0.75)

# Plot the Global Active Power time series using plot() with line type
with(powerConsumption, plot(datetime, Global_active_power,
                            xlab="",
                            ylab="Global Active Power (kilowatts)",
                            type="l"))


# Restore the old graphic parametes
par(oldpar)

# Close png device
dev.off()
