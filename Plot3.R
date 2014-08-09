# Source readData.R -- contains the readData() function to download the data and read it into a data frame
source("./readData.R")

# Create the data frame
powerConsumption <- readData("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

# Open png device (Plot3.png)
png(file="Plot3.png", width=480, height=480)

# Save the old graphic parameters
oldpar <- par()

# Change the text size to 75% of the default
par(cex=0.75)

# Draw the sub metering time series
with(powerConsumption, 
     # Plot the sub-metering time series for sub-meter 1 (kitchen)
     { plot(datetime, Sub_metering_1, type="l",
                            xlab="",
                            ylab="Energy sub metering")
       # Add sub-metering time series for sub-meter 2 (laundry room)
        lines(datetime, Sub_metering_2, type="l", col="red")
       # Add sub-metering time series for sub-meter 3 (water heater and air conditioner)
        lines(datetime, Sub_metering_3, type="l", col="blue")
    })

# Draw the legend at the top right with black, red, blue solid lines (lty=1)
legend("topright", col=c("black", "red", "blue"), lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Restore the old graphic parametes
par(oldpar)

# Close png device
dev.off()

