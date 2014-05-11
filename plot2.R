d <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

##concatenate date and time
d$DateTime <- strptime(paste(d$Date, d$Time),"%d/%m/%Y %H:%M:%S")

##limit the dataset to those 2 days
d2 <- subset(d, as.Date(DateTime) == "2007-02-01" | as.Date(DateTime) == "2007-02-02")

##set the export standards
png("plot2.png", height=480, width=480, units = "px", pointsize = 12, bg = "white")

##plot the canvas
plot(d2$DateTime, d2$Global_active_power, pch=NA, xlab = "", ylab="Global Active Power (kilowatts)")

##plot the lines in the canvas
lines(d2$DateTime, d2$Global_active_power)

##export and finish
dev.off()