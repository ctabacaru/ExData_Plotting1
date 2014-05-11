# Read data from the file: the file has each data element on a line, 
# whose attributes are separated by a ;
d=read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
d1=d[d$Date=="1/2/2007" | d$Date=="2/2/2007",]

#Convert the types 
d1$Time=strptime(paste(d1$Date,d1$Time), format="%d/%m/%Y %H:%M:%S")
d1[,3:9]=mapply(as.numeric,d1[,3:9])

#Plot 1
png(file = "plot1.png",width = 480, height = 480) 
par(mfrow = c(1,1))
hist(d1$Global_active_power, col="red",
     xlab="Global active power (kilowatts)",
     main = "Global Active Power"
     )
dev.off() 
