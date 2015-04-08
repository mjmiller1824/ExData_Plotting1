plot1<-function(){
  ##file is written for my file tree. It may need changed for yours. Original data set can be downloaded here.
  ##https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
    
  date1<-as.Date("1/2/2007","%d/%m/%Y")#Creates Date Boundaries as date objects
  date2<-as.Date("2/2/2007","%d/%m/%Y")#
  
  energydata<-read.csv('~/R-Johns Hopkins/cleaningdata/household_power_consumption.txt', sep=';', na.string='?')#gets data from downloaded file
  
  
  colED<-data.frame(Date=as.Date(energydata[,1],"%d/%m/%Y"),Global_active_power=energydata[,3])#Creates DF with date from imported data
                                                                                               #as data type date. And with the Global_active_power
                                                                                               #varible from the imported data set
  par(mar=c(4,5,3,1))
  hist(colED[colED$Date==date1|colED$Date==date2,3],col="Red",xlab="Global Active Power (kilowatts)",main="Global Active Power")#creates a histogram with subsetted data from the Global_active_power variable
  
  dev.copy(png, filename='plot1.png', width= 480, height=480, units="px",bg="transparent")#Creates png of histogram
  dev.off()#closes png
  
  
                    
  
 
  
}