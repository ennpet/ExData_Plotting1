# Making plot 4

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

createPlot1_1 <- function() {
    
    value_vector <- dt$Global_active_power
    plot(time_vector, value_vector, type = "n", xlab="", ylab="Global Active Power (kilowatts)")
    lines(time_vector, value_vector, type = "l")
}

createPlot1_2 <- function(){
    value_vector <- dt$Voltage
    plot(time_vector, value_vector, type = "n", xlab="datetime", ylab = "Voltage")
    lines(time_vector, value_vector, type = "l")
}

createPlot2_1 <- function(){
    time_vector <- strptime(paste(dt$Date, dt$Time), format= "%d/%m/%Y%H:%M:%S")
    plot(time_vector, dt$Sub_metering_1, type = "n", xlab="datetime", ylab = "Energy sub metering")
    lines(time_vector, dt$Sub_metering_1, type = "l")
    lines(time_vector, dt$Sub_metering_2, type = "l", col="red")
    lines(time_vector, dt$Sub_metering_3, type = "l", col="blue")
    legend("topright", lty=1, lwd=2, col = c("black", "blue", "red"), 
           legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
}

createPlot2_2 <- function(){
    value_vector <- dt$Global_reactive_power
    plot(time_vector, value_vector, type = "n", xlab="datetime", ylab = "Global_reactive_power")
    lines(time_vector, value_vector, type = "l")
}

#Creating plot and saving it to PNG file
plot4 <- function(){
    png(file = "plot4.png", width = 480, height = 480)
    par(mfrow = c(2, 2))
    
    createPlot1_1()
    createPlot1_2()
    createPlot2_1()
    createPlot2_2()
    
    dev.off()
}

#Main call
plot4()

