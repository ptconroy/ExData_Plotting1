library(lubridate)
library(dplyr)
plot2 <- function() {
    din <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
    first_day <- ymd("2007-02-01")
    second_day <- ymd("2007-02-02")
    our_days <- filter(din, dmy(Date) == second_day | dmy(Date) == first_day)
    temp_dt <- paste(our_days$Date, our_days$Time)
    final <- mutate(our_days, datetime = parse_date_time(temp_dt, "dmYHMS"))
    png("plot2.png")
    with(final, plot(Global_active_power ~ datetime, xlab = "",
                     type = "l", ylab = "Global Active Power (kilowatts)"))
    dev.off()
}