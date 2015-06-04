# Course project 1 for Coursera's "Exploratory data analysis" course

# read only the two days of interest
firstline = 66637
lastline =  69516
data = read.table("household_power_consumption.txt", sep=";", skip=firstline, nrows=lastline-firstline+1, na.strings="?")
names(data) = read.table("household_power_consumption.txt", sep=";", nrows=1, stringsAsFactors=FALSE)

# format date and time
data$Time = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, format="%d/%m/%Y")

png(filename = "plot3.png")
plot(data$Time, data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2,type="l",col="red")
lines(data$Time, data$Sub_metering_3,type="l",col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd="2", col=c("black","red","blue"))
dev.off()
