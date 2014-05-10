#Load once whole dataset in order to get the skip and nrow values. 
#This method is fast but not flexible and depends on the dataset is ordered.  
#df <- read.table("~/Documents/Exploratory_Analysis/Projects/#household_power_consumption.txt", #sep=";",header=TRUE,stringsAsFactors=FALSE)
#df$Date<-as.Date(df$Date,"%d/%m/%Y")
#df1<-subset(df, df$Date >= as.Date('2007-02-01') & df$Date <= as.Date('2007-02-02'))

#Load only data for two days (2007-02-01,2007-02-02)
df <- read.table("household_power_consumption.txt",
                 skip = 66637, nrow = 2880, sep = ";",stringsAsFactors=FALSE, 
                 col.names = colnames(read.table(
                   "household_power_consumption.txt",
                   nrow = 1, header = TRUE, sep=";")))

# Format Date column
df$Date<-as.Date(df$Date,"%d/%m/%Y")

#Create new column Date+Time
df$DT<-strptime(paste(df$Date,df$Time), "%Y-%m-%d %H:%M:%S")

#Graph Plot_3
par(bg = 'white')
with(df, plot(DT,Sub_metering_1,ylab="Energy sub metering",xlab="",type = "l"))
with(df, lines(DT,Sub_metering_2,col="red"))
with(df, lines(DT,Sub_metering_3,col="blue"))
legend("topright",cex=0.5, lty=c(1,1,1),col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file = "plot3.png", width=480, height=480)
dev.off()