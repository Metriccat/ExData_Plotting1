# Course project 1 for Coursera's "Exploratory data analysis" course

setwd("~/cours_ml_stats/data_toolbox_hopkins/programming/ExData_Plotting1")

# read only the two days of interest
firstline = 66637
lastline =  69516
data = read.table("household_power_consumption.txt", sep=";", skip=firstline, nrows=lastline-firstline+1, na.strings="?")
names(data) = read.table("household_power_consumption.txt", sep=";", nrows=1, stringsAsFactors=FALSE)

# format date and time
data$Time = strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, format="%d/%m/%Y")

png(filename = "plot1.png")
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power",col="red")
dev.off()
