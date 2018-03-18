# Read data

household<-read.table("household_power_consumption.txt", sep=";", dec=".", header=T, stringsAsFactors =F )
household$Date<-strptime(household$Date, "%d/%m/%Y")
household<-subset(household, Date=="2007-02-01" | Date=="2007-02-02")

#Plotting graph
household$Sub_metering_1<-as.numeric(household$Sub_metering_1)
household$Sub_metering_2<-as.numeric(household$Sub_metering_2)
household$Sub_metering_3<-as.numeric(household$Sub_metering_3)

household$Time_Date<-paste(household$Time, household$Date, sep= " ")
household$Time_Date<-strptime(household$Time_Date, "%H:%M:%S %Y-%m-%d")

Sys.setlocale("LC_ALL", "English")

with(household,plot(Time_Date, Sub_metering_1, type="l",xlab="", ylab="Energy sub metering"))
with(household, lines(Time_Date, Sub_metering_2, col="red"))
with(household, lines(Time_Date, Sub_metering_3, col="blue"))
legend("topright", legend=colnames(household)[7:9], col=c("black","red","blue"), lty=c(1,1,1))

dev.copy(png, "plot3.png")
dev.off()



