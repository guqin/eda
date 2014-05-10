plot3 <- function() {
  options(stringsAsFactors = FALSE)
  pwr <- read.table("household_power_consumption", header=TRUE, sep=";", as.is = TRUE )
  pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")
  days <- pwr[pwr$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
  days[,7:8] <- sapply(days[,7:8], as.numeric)
  dates <- paste(as.character(days$Date), days$Time)
  dates <- strptime(dates, "%Y-%m-%d %H:%M:%S")
  png("plot3.png")
  plot(dates, days$Sub_metering_1,pch="",xlab="",ylab="Energy sub metering")
  lines(dates,days$Sub_metering_1)
  lines(dates,days$Sub_metering_2, col="red")
  lines(dates,days$Sub_metering_3, col="blue")
  legend("topright", legend=names(days[,7:9]), col=c("black", "red", "blue") , lty=c(1,1,1))
  dev.off()
}