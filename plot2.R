plot2<-function(){
  ##file is written for my file tree. It may need changed for yours. Original data set can be downloaded here.
  ##https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
  
  date1<-as.POSIXct("1/2/2007 00:00:00",format="%d/%m/%Y %H:%M:%S") #sets outer boundaries of dates to be analyzed
  date2<-as.POSIXct("2/2/2007 23:59:59",format="%d/%m/%Y %H:%M:%S") #
  
  energydata<-read.csv('~/R-Johns Hopkins/cleaningdata/household_power_consumption.txt', sep=';', na.string='?')#gets data from downloaded file 
  
  datetime<-format(as.POSIXct(paste(energydata[,1], energydata[,2]),format="%d/%m/%Y %H:%M:%S"))#creates vector of time objects from date and time fields
  subenergy<-data.frame(datetime=as.POSIXct(datetime),#creates new dataframe with the created datetime varible
  Global_active_power=energydata[,3])                 #and the the Global_active_power variable 
  toplot<-subenergy[ (subenergy$datetime>=date1)&(subenergy$datetime<=date2),]#subsets for boundary dates
   par(mar=c(4,5,3,3))
  plot(toplot$datetime,toplot$Global_active_power,type="n",xlab="",ylab="Global Active Power (Kilowatts)")#plots line graph of 
  lines(toplot$datetime,toplot$Global_active_power,type="l")
  dev.copy(png, filename='plot2.png', width= 480, height=480, units="px",bg="transparent")#writes to .png file
  dev.off()#closes .png file
  
  
}