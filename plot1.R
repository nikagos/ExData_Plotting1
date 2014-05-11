d <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
d$Date<-as.Date(as.character(d$Date),"%d/%m/%Y")

##limit the dataset to those 2 days
d2<-subset(d, Date=="2007-02-01" | Date=="2007-02-02")

##concatenate date and time
d2 <- within(d2, DateTime <- paste(Date, Time, sep = ' '))

d2$Global_active_power<-as.numeric(as.character(d2$Global_active_power))

##set the export standards
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

##plot the histogram
with(d2, hist(d2$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))

##export and finish
dev.off()