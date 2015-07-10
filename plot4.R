
#reading the text file and creating the plot
setwd("~/github/exdata_plotting1")
type <- c(rep("character", 2), rep("numeric", 7))
dat <- read.table("household_power_consumption.txt", sep = ";",
                  colClasses = type, na.strings="?", header= TRUE)
dat$Date <- as.Date(dat$Date, "%d/ %m/ %Y") #used to filter the dates
dat1 <- dat[dat$Date == "2007-02-01"| dat$Date == "2007-02-02",]
dat1$date <- paste(dat1$Date, dat1$Time)
dat1$date <- strptime(dat1$date, "%Y -%m -%d %H:%M:%S")
#fourth plot
par(mfrow = c(2,2))
with(dat1, plot(x = date, y = Global_active_power, type = "l",
                ylab = " Global Active Power", xlab = "")) 
with(dat1, plot(x = date, y = Voltage, type = "l",
                ylab = "Voltage", xlab = "datetime"))
with(dat1, plot(x = date, y = Sub_metering_1, type ="l", col = "black",
                ylab = "Energy Sub metering", xlab = ""))
with(dat1, points(x = date, y = Sub_metering_2, type = "l", col = "red"))
with(dat1, points(x = date, y = Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, xjust = 1)
with(dat1, plot(x = date, y = Global_reactive_power, type = "l",
                ylab = " Global Reactive Power", xlab = ""))
dev.copy(png, file = "plot4.png")
dev.off()