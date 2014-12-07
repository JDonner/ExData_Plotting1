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
png(file='plot1.png')
hist(e$Global_active_power,
        col="red",
        xlab="Global Active Power (kilowatts)",
        main="Global Active Power")
dev.off()
