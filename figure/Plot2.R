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


## PLOT 2
# create and save .png of Plot 2
png(filename = "Plot2.png", width = 480, height = 480)
plot(data$DateTime,data$Global_active_power, type = "n", ylab="Global Active Power", xlab="Date")
lines(data$DateTime,data$Global_active_power)
dev.off()