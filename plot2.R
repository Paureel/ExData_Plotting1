#This script reads in the data and plots the Global Active Power using line plot.
#The plot was saved manually.
Sys.setlocale("LC_TIME", "English") 
xdata <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
xdata$Date <- as.Date(xdata$Date,format='%d/%m/%Y')
xdata <- xdata[complete.cases(xdata),]
newdata <- subset(xdata, Date == "2007-02-01" | Date == "2007-02-02" )
dt <- paste(newdata$Date, newdata$Time)
Time <- setNames(dt, "Time")
time_df <- cbind(Time, newdata)
newdata$time_df <- as.POSIXct(time_df$Time)
plot(newdata$Global_active_power~newdata$time_df, type="l", ylab="Global Active Power (kilowatts)", xlab="")