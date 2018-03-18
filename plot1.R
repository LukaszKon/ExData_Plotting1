# Read data

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "hpc.zip")
unzip("hpc.zip")

household<-read.table("household_power_consumption.txt", sep=";", dec=".", header=T, stringsAsFactors =F )
household$Date<-strptime(household$Date, "%d/%m/%Y")
household<-subset(household, Date=="2007-02-01" | Date=="2007-02-02")

#Plotting graph
household$Global_active_power<-as.numeric(household$Global_active_power)

hist(household$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()
