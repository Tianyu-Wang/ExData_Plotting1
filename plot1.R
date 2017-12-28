# Load data file
data <- read.csv(file = "household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subset data set
subsetdata <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
subsetdata$Global_active_power <- as.numeric(subsetdata$Global_active_power)

# Plot historgram
png(file = "plot1.png", width = 480, height = 480)
hist(subsetdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
