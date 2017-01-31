# ex. n. 1 of coursera -datascientist - exploratory analysisi
# by Paolo Masotti
# read the file with data
# -- RECORD FORMAT --
#Date: Date in format dd/mm/yyyy
#Time: time in format hh:mm:ss
#Global_active_power: household global minute-averaged active power (in kilowatt)
#Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#Voltage: minute-averaged voltage (in volt)
#Global_intensity: household global minute-averaged current intensity (in ampere)
#Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
#Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
#Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
# memory usage should be 0,1GB thus should be manageble by my LapTop
#  setwd("C:/Users/p.masotti/Documents/R/coursera/expAna/w1")

plot1<-function(DirF) {
  #read the file: only needed records
  setwd(DirF)
  initial<-read.table("household_power_consumption.txt",sep=";", nrow=100, header = TRUE)
  classes<-sapply(initial,class) #evaluate the class of each element and store in to a list
  #read the first 100K line: it's enough - set colClasses and NA value
  d1<-read.table("household_power_consumption.txt",sep=";", nrow=100000, header = TRUE, colClasses = classes,na.strings="?") 
  d1$Date<-as.Date(d1$Date,"%d/%m/%Y") # converts Date in data format
  d2<-subset(d1,Date=="2007-02-01"|Date=="2007-02-02" )# only selected days
  d2$Time<- strptime(paste(d2[,1],d2[,2]),format="%Y-%m-%d %H:%M:%S", tz="") #converts Time in Date Class format 

  png(file="plot1.png",width = 480, height = 480, units = "px")
  hist(d2[,3], col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  dev.off()
}






