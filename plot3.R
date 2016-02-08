#load the file into data
data <- read.table("household_power_consumption.txt", na.strings="?",
                   sep=";", header=TRUE,stringsAsFactors=FALSE)

#set the Date format 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subsetting 
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert datetime
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#plotting  3
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save  to plot3.png
dev.copy(png, file="plot3.png", height=500, width=500)
dev.off()