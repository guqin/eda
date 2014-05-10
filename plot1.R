plot1 <- function() {
  pwr <- read.table("household_power_consumption", header=TRUE, sep=";", as.is = TRUE )
  pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")
  days <- pwr[pwr$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]
  gapower <- as.numeric(days$Global_active_power)
  png("plot1.png")
  hist(gapower, col="red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)")
  dev.off()
}
