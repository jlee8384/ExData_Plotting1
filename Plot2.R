#Reading data set
dataFile <- "./data/household_power_consumption.txt"

#Naming data set
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE,dec = ".")

#Subsetting data set
subsetdata <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
subsetdata$Date <- as.Date(subsetdata$Date,"%d/%m/%Y")
subsetdata<-cbind(subsetdata, "DateTime" = as.POSIXct(paste(subsetdata$Date, subsetdata$Time)))

#Plotting line graph
plot(subsetdata$Global_active_power ~ subsetdata$DateTime, type="l", xlab= "", ylab="Global Active power (kilowatts)")

#Creating picture file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()