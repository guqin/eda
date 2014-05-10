plot2 <- function() {
  pwr <- read.table("household_power_consumption", header=TRUE, sep=";", as.is = TRUE )
  pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")
  days <- pwr[pwr$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
  gapower <- as.numeric(days$Global_active_power)
  dates <- paste(as.character(days$Date), days$Time)
  dates <- strptime(dates, "%Y-%m-%d %H:%M:%S")
  png("plot2.png")
  plot(dates, gapower,pch="",xlab="",ylab="Global Active Power (kilowatts)")
  lines(dates,gapower)
  dev.off()
}