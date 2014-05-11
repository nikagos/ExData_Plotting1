d <- read.table("household_power_consumption.txt", sep=";", header=TRUE,na.strings="?")

##concatenate date and time
d$DateTime <- strptime(paste(d$Date, d$Time), "%d/%m/%Y %H:%M:%S")

##limit the dataset to those 2 days
d2 <- subset(d, as.Date(DateTime) == "2007-02-01" | as.Date(DateTime) == "2007-02-02")

##set the export standards
png("plot3.png", height=480, width=480, units = "px", pointsize = 12, bg = "white")

##plot the canvas
plot(d2$DateTime, d2$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")

##plot the lines in the canvas
lines(d2$DateTime, d2$Sub_metering_1)
lines(d2$DateTime, d2$Sub_metering_2, col="red")
lines(d2$DateTime, d2$Sub_metering_3, col="blue")

line_names  <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
cols <- c("black", "red", "blue")
line_types <- c(1,1,1)

##append the legend in the canvas
legend("topright", line_names, lty = line_types, col = cols)

##export and finish
dev.off()