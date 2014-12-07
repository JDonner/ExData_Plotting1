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

d$date <- strptime(d$Date, "%d/%m/%Y")
e <- subset(d, "2007-02-01" <= d$date & d$date <= "2007-02-02")
e$dt <- as.POSIXlt(paste(e$Date, e$Time), format="%d/%m/%Y %H:%M:%S")
png(file='plot3.png')
plot(e$dt, e$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(e$dt, e$Sub_metering_2,col='red')
lines(e$dt, e$Sub_metering_3,col='blue')
legend("topright",
       lty=1,
       col=c("black","red","blue"),
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"))
dev.off()
