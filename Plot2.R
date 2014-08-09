# Source the readData() function which downloads the data set and creates the data frame for the 
# two dates
source("./readData.R")

# Create the data frame
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
