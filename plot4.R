d <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

##concatenate date and time
d$DateTime <- strptime(paste(d$Date, d$Time),"%d/%m/%Y %H:%M:%S")

##limit the dataset to those 2 days
d2 <- subset(d, as.Date(DateTime) == "2007-02-01" | as.Date(DateTime) == "2007-02-02")

##set the export standards
png("plot4.png", height=480, width=480, units = "px", pointsize = 12, bg = "white")

##set a 2x2 matrix to place all the four plots below
par(mfrow = c(2,2))

##plot graph 1
plot(d2$DateTime, d2$Global_active_power, pch=NA, xlab = "", ylab="Global Active Power")
lines(d2$DateTime, d2$Global_active_power)

##plot graph 2
plot(d2$DateTime, d2$Voltage, pch=NA, xlab = "datetime", ylab="Voltage")
lines(d2$DateTime, d2$Voltage)

##plot graph 3
plot(d2$DateTime, d2$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")

lines(d2$DateTime, d2$Sub_metering_1)
lines(d2$DateTime, d2$Sub_metering_2, col="red")
##lines(d2$DateTime, d2$Sub_metering_3, col="blue")
lines(d2$DateTime, d2$Sub_metering_3, col="blue")

line_names  <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
cols <- c("black", "red", "blue")
line_types <- c(1,1,1)

legend("topright", line_names, lty = line_types, col = cols, bty = "n")

##plot graph 4
plot(d2$DateTime, d2$Global_reactive_power, pch=NA, xlab = "datetime", ylab="Global_reactive_power")
lines(d2$DateTime, d2$Global_reactive_power)

##export and finish
dev.off()
