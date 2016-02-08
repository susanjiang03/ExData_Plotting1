#load the file into data
data <- read.table("household_power_consumption.txt", na.strings="?",
                   sep=";", header=TRUE,stringsAsFactors=FALSE)

#set the Date format 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subsetting 
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#plotting 
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#save  to plot1.png
dev.copy(png, file="plot1.png", height=500, width=500)
dev.off()