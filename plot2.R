#####IMPORT DATA#####

DT <- suppressWarnings(read.csv("household_power_consumption.txt",sep = ";", na.strings = '?',colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")))

#Subset original data.table to only the dates required
DT <- DT[which(DT$Date %in% c("1/2/2007","2/2/2007")),]

#Convert Date and Time Variables to the correct Format

DT$Time <- paste(DT$Date, DT$Time, sep = " ")

DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")

DT$Time <- strptime(DT$Time, format = "%d/%m/%Y %H:%M:%S")

#####IMPORT DATA#####

#PLOT 2#

png(file = "plot2.png", width = 480, height = 480)
plot(DT$Time,DT$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(DT$Time,DT$Global_active_power)
dev.off()