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

# generate the plot
png("plot3.png", width=480, height=480)

plot(data[, DateTime], data[, Sub_metering_1], xlab="", ylab="Energy sub metering")
lines(data[, DateTime], data[, Sub_metering_1],col="black")
lines(data[, DateTime], data[, Sub_metering_2],col="red")
lines(data[, DateTime], data[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(2,2))

dev.off()
