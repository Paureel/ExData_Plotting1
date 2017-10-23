#This script reads in the data and make a histogram of the global active power of the house on the selected two days.
#The plot was saved manually
xdata <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
xdata$Date <- as.Date(xdata$Date,format='%d/%m/%Y')
xdata <- xdata[complete.cases(xdata),]
newdata <- subset(xdata, Date == "2007-02-01" | Date == "2007-02-02" )
newdata$Global_active_power <- newdata$Global_active_power

hist(newdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", border="black", col="red")
