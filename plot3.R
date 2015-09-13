# Making plot 3

# Setting US locale for windows OS
Sys.setlocale("LC_TIME", "English")

#Parsing date
parseDate <- function(dateStr) {
    as.Date(dateStr, format = "%d/%m/%Y")
}

#Loading the data
DT <-
    read.csv(
        "household_power_consumption.txt", sep = ";", na.strings = "?",
        colClasses = c(Date = "character", Time = "character", rep("numeric", 7))
    )

#using only data from the dates 2007-02-01 and 2007-02-02
dt <- subset(DT, (parseDate(Date) == parseDate("01/02/2007"))
             | (parseDate(Date)  == parseDate("02/02/2007")))

#Creating plot
createPlot3 <- function() {
    dt <- readData()
    
    time_vector <- strptime(paste(dt$Date, dt$Time), format= "%d/%m/%Y%H:%M:%S")
    plot(time_vector, dt$Sub_metering_1, type = "n", xlab="datetime", ylab = "Energy sub metering")
    lines(time_vector, dt$Sub_metering_1, type = "l")
    lines(time_vector, dt$Sub_metering_2, type = "l", col="red")
    lines(time_vector, dt$Sub_metering_3, type = "l", col="blue")
    legend("topright", lty=1, lwd=2, col = c("black", "blue", "red"), 
           legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
}

#Creating plot and saving it to PNG fileplot3 <- function() {
    png(file = "plot3.png", width = 480, height = 480)
    createPlot3()
    dev.off()
}

#Main call
plot3()

