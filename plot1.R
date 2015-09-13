# Making plot 1


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
createPlot1 <- function() {
    hist(
        dt$Global_active_power, col = "red",
        xlab = "Global Active Power (kilowatts)", main = "Global Active Power"
    )
}

# Creating plot and saving it to PNG file
plot1 <- function() {
    png(file = "plot1.png", width = 480, height = 480)
    createPlot1()
    dev.off()
}

# Main call
plot1()








