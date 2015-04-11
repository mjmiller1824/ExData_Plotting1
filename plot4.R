plot4<-function(){
  ##file is written for my file tree. It may need changed for yours. Original data set can be downloaded here.
  ##https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
  
  date1<-as.POSIXct("1/2/2007 00:00:00",format="%d/%m/%Y %H:%M:%S") #sets outer boundaries of dates to be analyzed
  date2<-as.POSIXct("2/2/2007 23:59:59",format="%d/%m/%Y %H:%M:%S") #
  
  energydata<-read.csv('~/R-Johns Hopkins/cleaningdata/household_power_consumption.txt', sep=';', na.string='?')#gets data from downloaded file 
  
  datetime<-format(as.POSIXct(paste(energydata[,1], energydata[,2]),format="%d/%m/%Y %H:%M:%S"))#creates vector of time objects from date and time fields
  subenergy<-data.frame(datetime=as.POSIXct(datetime),#creates new dataframe with the created datetime varible and rest of columns
                        Global_active_power=energydata[,3],#except for Global_intensity(col6) which is not needed for this study
                        Global_reactive_power=energydata[,4],
                        Voltage=energydata[,5],
                        Sub_metering_1=energydata[,7],
                        Sub_metering_2=energydata[,8],
                        Sub_metering_3=energydata[,9])                 
  toplot<-subenergy[ (subenergy$datetime>=date1)&(subenergy$datetime<=date2),]#subsets for boundary dates
  par(mfrow=c(2,2),cex.lab=.5,cex.axis=.75)#Tells R to present all plots on a single page and changes the cex setting to make labels appear as they do in example.
  par(mar=c(4,5,3,3))
  
  plot(toplot$datetime,toplot$Global_active_power,type="n",xlab="",ylab="Global Active Power")#plots line graph of global active power vs time.
  lines(toplot$datetime,toplot$Global_active_power,type="l")
  
  plot(toplot$datetime,toplot$Voltage,type="n",ylab="Voltage",xlab="datetime")#plots second graph at top comparing voltage and datetime
  lines(toplot$datetime,toplot$Voltage,type="l")
  
    
  plot(toplot$datetime,toplot$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")#plots line graph of Submetering 1-3
  lines(toplot$datetime,toplot$Sub_metering_1,type="l",col="black")
  lines(toplot$datetime,toplot$Sub_metering_2,type="l",col="red")
  lines(toplot$datetime,toplot$Sub_metering_3,type="l",col="blue")
  legend("topright",lty=1,cex=.2,col=c("black","red","blue"),bty="n",legend=c("Sub_metering_1", #Cex is used because the legend and labels would not draw at the correct size.
                                                                      "Sub_metering_2",
                                                                      "Sub_metering_3"))
  
  
  plot(toplot$datetime,toplot$Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime",cex.axis=.4)#plots graph at bottom left
  lines(toplot$datetime,toplot$Global_reactive_power,type="l")
  
 
  dev.copy(png, filename='plot4.png', width= 480, height=480, units="px",bg="transparent")#writes to .png file. 
  dev.off()#closes .png file
  
  
}
