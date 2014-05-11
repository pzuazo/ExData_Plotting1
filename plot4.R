# read.csv.sql {sqldf} will be used to read a file into R filtering it with 
# a sql statement. Only the filtered portion is processed by R so that files larger
# than R can otherwise handle can be accommodated.

require("sqldf")
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
data <- read.csv.sql(myFile, mySql, sep=";")

# I will create an extra column (called "Times") for date+time with Time class
dates <- data[,"Date"]
times <- data[,"Time"]
x <- paste(dates, times)
x <- strptime(x, format = "%d/%m/%Y %H:%M:%S")
x <- data.frame(x1)

data[,"Times"] <- x[,1]

# Construct plot4 and save it to a PNG file with a width of 480 pixels
# and a height of 480 pixels

png(filename = "plot4.png",
    width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
with(data, {
        #4.1
        plot(Times, Global_active_power, 
             xlab ="", ylab = "Global Active Power (kilowatts)",
             type = "l"
        )
        
        #4.2
        plot(Times, Voltage, 
             xlab ="datetime", ylab = "Voltage",
             type = "l"
        )
        
        #4.3
        plot(Times, Sub_metering_1, 
             xlab ="", ylab = "Energy sub metering",
             type = "n")
        with(data, lines(Times, Sub_metering_1, col = "black"))
        with(data, lines(Times, Sub_metering_2, col = "red"))
        with(data, lines(Times, Sub_metering_3, col = "blue"))
        legend("topright", lty = "solid", col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               bty = "n")
        
        #4.4
        plot(Times, Global_reactive_power, 
             xlab ="datetime", ylab = "Global_reactive_power",
             type = "l"
        )
})
dev.off()