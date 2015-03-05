#####IMPORT DATA#####

DT <- suppressWarnings(read.csv("household_power_consumption.txt",sep = ";", na.strings = '?',colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")))

#Subset original data.frame to only the dates required
DT <- DT[which(DT$Date %in% c("1/2/2007","2/2/2007")),]

#Convert Date and Time Variables to the correct Format

DT$Time <- paste(DT$Date, DT$Time, sep = " ")

DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")

DT$Time <- strptime(DT$Time, format = "%d/%m/%Y %H:%M:%S")

#####IMPORT DATA#####


###PLOT 4###
png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
par(mar = c(4,4,3,2))

#Plot1...#

plot(DT$Time,DT$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
lines(DT$Time,DT$Global_active_power)

#Plot2...#
plot(DT$Time,DT$Voltage, type = "n", xlab = "datetime", ylab = "Voltage",)
lines(DT$Time,DT$Voltage)


#Plot3...#
plot(DT$Time,DT$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(DT$Time,DT$Sub_metering_1, col = "black")
lines(DT$Time,DT$Sub_metering_2, col = "red")
lines(DT$Time,DT$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col = c("black","red","blue"), lwd = c(2.5,2.5,2.5),bty = "n", cex = .75)


#Plot4...#
plot(DT$Time,DT$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power",)
lines(DT$Time,DT$Global_reactive_power)

dev.off()