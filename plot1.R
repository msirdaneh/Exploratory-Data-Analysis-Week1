# read date file
data <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# convert date column to Date type
data$Date <- as.Date(as.character(data$Date),"%d/%m/%Y")

# convert Global_active_power column to numeric type
data$Global_active_power <- as.numeric(as.character(unlist(data$Global_active_power)))
# Extract The specified date 01-02-2007 to 02-02-2007
data <- data[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# open graphic devide
png("plot1.png", width=480, height=480)
hist(data[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off() # close device

