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

## PLOT 1
# create and save .png of plot 1
png(filename = "Plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power", col = "red")
dev.off()