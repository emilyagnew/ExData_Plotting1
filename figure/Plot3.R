## COURSE PROJECT 1 

# set working directory
setwd("Course Project 1")
# read in dataset
dataAll <- read.table("household_power_consumption.txt", header = TRUE, comment.char = "", sep = ";", nrows = 2075259)
# reformat dates
dataAll$Date <- as.Date(as.character(dataAll$Date), format="%d/%m/%Y")
# remove data not between 2007-02-01 & 2007-02-02
data<-subset(dataAll,dataAll$Date>=as.Date("2007-02-01")&dataAll$Date<=as.Date("2007-02-02"))
data$Global_active_power<-as.numeric(data$Global_active_power)

# create DateTime (combining the date and time) and reformatting
data$DateTime<-paste(as.character(data$Date),as.character(data$Time))
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")
# convert to numeric
data$Sub_metering_1<-as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]  
data$Sub_metering_2<-as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]

## PLOT 3
# create and save .png of Plot 3
png(filename = "Plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "n", ylab="Energy sub meeting", xlab="Date")
lines(data$DateTime,data$Sub_metering_1)
lines(data$DateTime,data$Sub_metering_2, col="red")
lines(data$DateTime,data$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1), col = c("black","red","blue"))
dev.off()