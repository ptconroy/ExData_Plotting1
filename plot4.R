library(lubridate)
library(dplyr)
plot4 <- function() {
    din <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
    first_day <- ymd("2007-02-01")
    second_day <- ymd("2007-02-02")
    our_days <- filter(din, dmy(Date) == second_day | dmy(Date) == first_day)
    temp_dt <- paste(our_days$Date, our_days$Time)
    final <- mutate(our_days, datetime = parse_date_time(temp_dt, "dmYHMS"))
    
    #set up for four graphs
    
    png("plot4.png")
    par(mfcol = c(2, 2))
    
    #make the first graph
    
    with(final, plot(Global_active_power ~ datetime, xlab = "",
                     type = "l", ylab = "Global Active Power (kilowatts)"))
    
    #make the second graph
    
    with(final, plot(Sub_metering_1 ~ datetime, xlab = "",
                     type = "l", ylab = "Energy sub metering"))
    with(final, points(Sub_metering_2 ~ datetime, type = "l", col = "red"))
    with(final, points(Sub_metering_3 ~ datetime, type = "l", col = "blue"))
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"), lwd = 1, bty = "n")
    
    # third graph
    
    with(final, plot(Voltage ~ datetime, type = "l"))
    
    # fourth graph
    
    with(final, plot(Global_reactive_power ~ datetime, type = "l"))
    
    dev.off()
}