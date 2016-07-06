library(lubridate)
library(dplyr)
plot1 <- function() {
    # read in the data and filter out everything but our subject dates
    din <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
    first_day <- ymd("2007-02-01")
    second_day <- ymd("2007-02-02")
    our_days <- filter(din, dmy(Date) == second_day | dmy(Date) == first_day)
    
    # make the histogram in a png file
    png("plot1.png")
    hist(our_days$Global_active_power, col = "red",
         main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
    dev.off()
}