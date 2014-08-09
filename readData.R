
# Set working directory
setwd("~/Documents/MOOCs/Data Science Specialization/Course4_Exploratory-Data-Analysis/Projects/ExData_Plotting1")

library(sqldf)

## Read data from a URL to a zip file that contains a single file
## We assume that the data set is too large to read into memory, so we use the sqldf package
## to read the file, using a SQL SELECT to choose just the rows we want
readData <- function(url) {
  
  # Extract the name of the zip file from the URL
  zipFile <- basename(URLdecode(url))
  
  # If data directory doesn't exist, create it
  if (!file.exists("./data")) {
    dir.create("./data")
  }
  
  # Save the current working directory and cd into ./data
  oldwd <- getwd()
  setwd("./data")
  
  # If data directory is empty, download the data set, otherwise we've already downloaded it
  if (length(list.files(".")) == 0) {
    download.file(url, zipFile, method="curl") 
  }
  
  # Unzip the data set
  unzipFile <- unzip(zipFile,list=TRUE)$Name   # find the name
  unzip(zipFile)
  
  # Read the data from the two dates
  df <- read.csv2.sql(unzipFile, sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
  
  # Create a new variable that creates a POSIX Date object from the Date and Time variables
  df$datetime <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")

  # Restore the working directory
  setwd(oldwd)
  
  closeAllConnections()
  
  # Return the data frame
  return(df)

}