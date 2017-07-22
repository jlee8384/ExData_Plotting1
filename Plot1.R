#Reading data set
dataFile <- "./data/household_power_consumption.txt"

#Naming data set
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE,dec = ".")

#Subsetting data set
subsetdata <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
subsetdata$Date <- as.Date(subsetdata$Date,"%d/%m/%Y")
subsetdata<-cbind(subsetdata, "DateTime" = as.POSIXct(paste(subsetdata$Date, subsetdata$Time)))

#Plotting histogram
hist(as.numeric(subsetdata$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")

#Creating picture file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

