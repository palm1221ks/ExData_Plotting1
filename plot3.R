#####IMPORT DATA#####

DT <- suppressWarnings(read.csv("household_power_consumption.txt",sep = ";", na.strings = '?',colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")))

#Subset original data.table to only the dates required
DT <- DT[which(DT$Date %in% c("1/2/2007","2/2/2007")),]

#Convert Date and Time Variables to the correct Format

DT$Time <- paste(DT$Date, DT$Time, sep = " ")

DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")

DT$Time <- strptime(DT$Time, format = "%d/%m/%Y %H:%M:%S")

#####IMPORT DATA#####

#PLOT 3#
png(file = "plot3.png", width = 480, height = 480)
  plot(DT$Time,DT$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(DT$Time,DT$Sub_metering_1, col = "black")
  lines(DT$Time,DT$Sub_metering_2, col = "red")
  lines(DT$Time,DT$Sub_metering_3, col = "blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col = c("black","red","blue"), lwd = c(2.5,2.5,2.5))
dev.off()