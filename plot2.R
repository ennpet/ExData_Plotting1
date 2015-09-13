# Making plot 2

# Setting US locale for windows OS
Sys.setlocale("LC_TIME", "English")

# Parsing date
parseDate <- function(dateStr) {
    as.Date(dateStr, format = "%d/%m/%Y")
}

# Loading the data
DT <-
    read.csv(
        "household_power_consumption.txt", sep = ";", na.strings = "?",
        colClasses = c(Date = "character", Time = "character", rep("numeric", 7))
    )

# Using only data from the dates 2007-02-01 and 2007-02-02
dt <- subset(DT, (parseDate(Date) == parseDate("01/02/2007"))
             | (parseDate(Date)  == parseDate("02/02/2007")))

# Creating plot
createPlot2 <- function() {
    value_vector <- dt$Global_active_power
    plot(time_vector, value_vector, type = "n", xlab="", ylab="Global Active Power (kilowatts)")
    lines(time_vector, value_vector, type = "l")
}

# Creating plot and saving it to PNG file
plot2 <- function() {
    png(file = "plot2.png", width = 480, height = 480)
    createPlot2()
    dev.off()
}

# Main call
plot2()


