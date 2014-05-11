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

# Construct plot2 and save it to a PNG file with a width of 480 pixels
# and a height of 480 pixels

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
with(data, plot(Times, Global_active_power, 
                xlab ="", ylab = "Global Active Power (kilowatts)",
                type = "l"
                ))
dev.off()