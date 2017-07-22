#Reading data set
dataFile <- "./data/household_power_consumption.txt"

#Naming data set
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE,dec = ".")

#Subsetting data set
subsetdata <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
subsetdata$Date <- as.Date(subsetdata$Date,"%d/%m/%Y")
subsetdata<-cbind(subsetdata, "DateTime" = as.POSIXct(paste(subsetdata$Date, subsetdata$Time)))

#Plotting graph
par(mfrow=c(2,2))
plot(subsetdata$Global_active_power ~ subsetdata$DateTime, type="l", xlab="", ylab="Global Active Power")
plot(subsetdata$Voltage ~ subsetdata$DateTime, type="l", xlab="datetime", ylab="Voltage")

with(subsetdata, {plot(Sub_metering_1 ~ DateTime, type="l", xlab="", ylab="Energy sub metering")})
lines(subsetdata$Sub_metering_2 ~ subsetdata$DateTime, col = 'Red')
lines(subsetdata$Sub_metering_3 ~ subsetdata$DateTime, col = 'Blue')

plot(subsetdata$Global_reactive_power ~ subsetdata$DateTime, type="l", xlab="datetime", ylab="Global_reactive_power")

#Creating picture file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()