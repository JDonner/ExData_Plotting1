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
png(file='plot2.png')
plot(e$dt, e$Global_active_power,
     type='l',
     xlab='',
     ylab='Global Active Power (kilowatts)')
dev.off()
