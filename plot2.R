#reading the text file and creating the plot
setwd("~/github/exdata_plotting1")
type <- c(rep("character", 2), rep("numeric", 7))
dat <- read.table("household_power_consumption.txt", sep = ";",
                  colClasses = type, na.strings="?", header= TRUE)
dat$Date <- as.Date(dat$Date, "%d/ %m/ %Y") #used to filter the dates
dat1 <- dat[dat$Date == "2007-02-01"| dat$Date == "2007-02-02",]
dat1$date <- paste(dat1$Date, dat1$Time)
dat1$date <- strptime(dat1$date, "%Y -%m -%d %H:%M:%S")

#second Plot
plot(x = dat1$date, y = dat1$Global_active_power, data = dat1, type = "l",
     ylab = " Global Active Power (Kilowatts)", xlab = "") 
dev.copy(png, file = "plot2.png")
dev.off()
