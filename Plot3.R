#Reading data set
dataFile <- "./data/household_power_consumption.txt"

#Naming data set
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE,dec = ".")

#Subsetting data set
subsetdata <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
subsetdata$Date <- as.Date(subsetdata$Date,"%d/%m/%Y")
subsetdata<-cbind(subsetdata, "DateTime" = as.POSIXct(paste(subsetdata$Date, subsetdata$Time)))

#Plotting graph
with(subsetdata, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy sub metering")})

lines(subsetdata$Sub_metering_2 ~ subsetdata$DateTime, col = 'Red')
lines(subsetdata$Sub_metering_3 ~ subsetdata$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Creating picture file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()