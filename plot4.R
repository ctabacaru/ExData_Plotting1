# Read data from the file: the file has each data element on a line, 
# whose attributes are separated by a ;
d=read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
d1=d[d$Date=="1/2/2007" | d$Date=="2/2/2007",]

#Convert the types 
d1$Time=strptime(paste(d1$Date,d1$Time), format="%d/%m/%Y %H:%M:%S")
d1[,3:9]=mapply(as.numeric,d1[,3:9])

#Plot 4
png(file = "plot4.png",width = 480, height = 480) 
par(mfrow = c(2, 2))
plot(d1$Time, d1$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global active power (kilowatts)")
plot(d1$Time, d1$Voltage, 
     type="l",
     xlab="datetime",
     ylab="Voltage")
plot(d1$Time, d1$Sub_metering_1, 
     type="l",
     xlab="",
     ylab="Energy submetering", 
     col="black")
lines(d1$Time, d1$Sub_metering_2, 
      col="red")
lines(d1$Time, d1$Sub_metering_3, 
      col="blue")
legend("topright", lty=1,
       col = c("black", "red", "blue"),
       cex=1,
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(d1$Time, d1$Global_reactive_power, 
     type="l",
     xlab="datetime",
     ylab="Global reactive power (kilowatts)")
dev.off() 

