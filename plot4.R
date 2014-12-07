library(datasets)

d <- read.table(
 "/home/jd/raid/classes/exploratory/wk1/household_power_consumption.txt",
 header=T,
 sep=";",
 na.strings="?",
 colClasses=c("character",
              "character",
              "numeric",
              "numeric",
              "numeric",
              "numeric",

              "numeric",
              "numeric",
              "numeric"
              ))
# e$dt <- strptime(e$Date, "%d/%m/%Y")
# e$tm <- strptime(e$Time, "%H:%M:%S")
d$date <- strptime(d$Date, "%d/%m/%Y")
e <- subset(d, "2007-02-01" <= d$date & d$date <= "2007-02-02")
e$dt <- as.POSIXlt(paste(e$Date, e$Time), format="%d/%m/%Y %H:%M:%S")
png(file='plot4.png')
par(mfrow = c(2,2))
with(e, {
  plot(dt, Global_active_power, type='l', xlab='', ylab='Global Active Power')
  plot(dt, Voltage, type='l', ylab='Voltage', xlab='datetime')
  plot(dt, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
  lines(dt, Sub_metering_2,col='red')
  lines(dt, Sub_metering_3,col='blue')
  legend("topright", lty=1,
         col=c("black","red","blue"),
         bty='n',
         legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  plot(dt, Global_reactive_power, type='l', xlab='datetime')
})
dev.off()
