
# Set working directory
setwd("~/Documents/MOOCs/Data Science Specialization/Course4_Exploratory-Data-Analysis/Projects/ExData_Plotting1")

library(sqldf)

## Read data from a URL to a zip file that contains a single file
readData <- function(url) {
  
  # Extract the name of the zip file from the URL
  zipFile <- basename(URLdecode(url))
  unzipFile <- paste(strsplit(zipFile, "[.]")[[1]][1], "txt", sep=".")
  
  # If data directory doesn't exist, create it
  if (!file.exists("./data")) {
    dir.create("./data")
  }
  
  zipPath <- paste("./data", zipFile, sep="/")
  
  # If data directory is empty, download the data set, otherwise we've already downloaded it
  if (length(list.files("./data")) == 0) {
    download.file(url, zipPath, method="curl") 
  }
  
  unzipPath <- paste("./data", unzip(zipPath,list=TRUE)$Name, sep="/")
  
  df <- read.csv2.sql(unzipPath, sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'")

  
  return(df)
}