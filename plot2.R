## Read in the data
data <- read.csv("./household_power_consumption.txt", sep=";", head=TRUE)

## Format the dates using as.Date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset down to the 2 days we need.
sub <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

## Format the times using strptime()
sub$Time <- strptime(paste(sub$Date, sub$Time), format="%Y-%m-%d %H:%M:%S")

## Format Global Active Power as numeric
gap <- as.numeric(as.character(sub$Global_active_power))

## Create the Graph
png(filename="plot2.png", width=480, height=480)
plot(sub$Time, gap, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()