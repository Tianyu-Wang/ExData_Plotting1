# Load data file
data <- read.csv(file = "household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subset data set
subsetdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
subsetdata$DateTime <- as.POSIXct(paste(subsetdata$Date, subsetdata$Time))
subsetdata$Global_active_power <- as.numeric(subsetdata$Global_active_power)
subsetdata$Global_reactive_power <- as.numeric(subsetdata$Global_reactive_power)
subsetdata$Voltage <- as.numeric(subsetdata$Voltage)
subsetdata$Sub_metering_1 <- as.numeric(subsetdata$Sub_metering_1)
subsetdata$Sub_metering_2 <- as.numeric(subsetdata$Sub_metering_2)
subsetdata$Sub_metering_3 <- as.numeric(subsetdata$Sub_metering_3)

# Plot charts
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(subsetdata$DateTime, subsetdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(subsetdata$DateTime, subsetdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(subsetdata$DateTime, subsetdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subsetdata$DateTime, subsetdata$Sub_metering_2, type = "l", col = "red")
lines(subsetdata$DateTime, subsetdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"))

plot(subsetdata$DateTime, subsetdata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
