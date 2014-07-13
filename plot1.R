## Read in the data
data <- read.csv("./household_power_consumption.txt", sep=";", head=TRUE)

## Format the dates using as.Date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset down to the 2 days we need.
sub <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

## Format the times using strptime()
sub$Time <- strptime(sub$Time, format="%H:%M:%S")

## Format Global Active Power as numeric
gap <- as.numeric(as.character(sub$Global_active_power))

## Create the Graph
png(filename="plot1.png", width=480, height=480)
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()