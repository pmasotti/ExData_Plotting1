plot3<-function(DirF) {
  #read the file: only needed records
  setwd(DirF)
  initial<-read.table("household_power_consumption.txt",sep=";", nrow=100, header = TRUE)
  classes<-sapply(initial,class) #evaluate the class of each element and store in to a list
  #read the first 100K line: it's enough - set colClasses and NA value
  d1<-read.table("household_power_consumption.txt",sep=";", nrow=100000, header = TRUE, colClasses = classes,na.strings="?") 
  d1$Date<-as.Date(d1$Date,"%d/%m/%Y") # converts Date in data format
  d2<-subset(d1,Date=="2007-02-01"|Date=="2007-02-02" )# only selected days
  d2$Time<- strptime(paste(d2[,1],d2[,2]),format="%Y-%m-%d %H:%M:%S", tz="") #converts Time in Date Class format 
  
  png(file="plot3.png",width = 480, height = 480, units = "px")
  plot(d2[,2],d2[,7], type="l",xlab="",ylab ="Energy Sub Metering" )
  points(d2[,2],d2[,8], type="l",col="red" )
  points(d2[,2],d2[,9], type="l",col="blue" )
  legend(x="topright", c(names(d2[7]),names(d2[8]),names(d2[9])), col = c("black", "red", "blue"),text.col = "black", lty = c(1, 1, 1), merge = TRUE )
  dev.off()
  }