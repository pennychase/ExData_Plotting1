# Source readData.R -- contains the readData() function to download the data and read it into a data frame
source("./readData.R")

# Read the data and create a data frame of the observations from 2007-02-01 and 2007-02-02
powerConsumption <- readData("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

# Open png device (Plot4.png)
png(file="Plot4.png", width=480, height=480)

# Save the old graphic parameters
oldpar <- par()

# Multiple plots in a 2x2 layout
par(mfrow=c(2,2))

with(powerConsumption, {
  # Upper left plot (Plot 1 with slight change to y-axis label)
  plot(datetime, Global_active_power,
       xlab="",
       ylab="Global Active Power",
       type="l")
  # Upper right plot (time series of Voltage)
  plot(datetime, Voltage, type="l")
  # Lower left plot (Plot 3 with slight change to legend)
  plot(datetime, Sub_metering_1, type="l",
       xlab="",
       ylab="Energy sub metering")
  lines(datetime, Sub_metering_2, type="l", col="red")
  lines(datetime, Sub_metering_3, type="l", col="blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, bty="n", y.intersp=1.0,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  # Lower right plot (time series of Global reactive power)
  plot(datetime, Global_reactive_power, type="l")
  })

# Restore the old graphic parametes
par(oldpar)

# Close png device
dev.off()
