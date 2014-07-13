## Read in the data
data <- read.csv("./household_power_consumption.txt", sep=";", head=TRUE)

## Format the dates using as.Date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset down to the 2 days we need.
sub <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

## Format the times using strptime()
sub$Time <- strptime(paste(sub$Date, sub$Time), format="%Y-%m-%d %H:%M:%S")
sub$Sub_metering_1 <- as.numeric(as.character(sub$Sub_metering_1))
sub$Sub_metering_2 <- as.numeric(as.character(sub$Sub_metering_2))
sub$Sub_metering_3 <- as.numeric(as.character(sub$Sub_metering_3))

## Format Global Active Power as numeric
gap <- as.numeric(as.character(sub$Global_active_power))

## Create the Graph
png(filename="plot3.png", width=480, height=480)
plot(sub$Time, sub$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
points(sub$Time, sub$Sub_metering_1, type="l")
points(sub$Time, sub$Sub_metering_2, type="l", col="red")
points(sub$Time, sub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))
dev.off()