# read date file
data <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

# convert date column to Date type
data$Date <- as.Date(as.character(data$Date),"%d/%m/%Y")

# Extract The specified date 01-02-2007 to 02-02-2007
data <- data[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# convert Global_active_power column to numeric type
data$Global_active_power <- as.numeric(as.character(unlist(data$Global_active_power)))

# convert time to column to time class
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

######################################################

png("plot2.png", width=480, height=480)

plot(x = data[, DateTime]
     , y = data[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

