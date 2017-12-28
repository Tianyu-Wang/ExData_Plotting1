# Load data file
data <- read.csv(file = "household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subset data set
subsetdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
subsetdata$DateTime <- as.POSIXct(paste(subsetdata$Date, subsetdata$Time))
subsetdata$Global_active_power <- as.numeric(subsetdata$Global_active_power)

# Plot line chart
png(file = "plot2.png", width = 480, height = 480)
plot(subsetdata$DateTime, subsetdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()