###########################################
##                                       ##
##        Coursera Data Science          ##
##      Exploratory Data Analysis        ##
##                                       ##
##            Assignement 1              ##
##                                       ##
###########################################
##                                       ##
##          Created By Ellume            ##
##         September 11, 2015            ##
##                                       ##
###########################################

plot2 <- function () {
  
  # The household_power_consumption.txt dataset is required in the working directory
  # for this function to work correctly.
  
  # Read in the data and combine Date and Time into datetime
  data = read.table("./household_power_consumption.txt", header=T,sep=";",na.strings="?")
  data.used=data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
  data.datetime=strptime(paste(data.used$Date,data.used$Time),format= "%d/%m/%Y %H:%M:%S")
  data.clean=cbind(datetime=data.datetime,data.used[3:9])
  
  # Write plot to png file
  png(file="plot2.png",width = 480, height = 480, units = "px")
  par(mfcol=c(1,1))
  par(bg="transparent")
  par(cex=.75)
  plot(data.clean$datetime,
       data.clean$Global_active_power,
       type="l",
       ylab="Global Active Power (kilowatts)",
       xlab="")
  
  # Make dev.off invisible to avoid null device return for function
  invisible(dev.off())
}