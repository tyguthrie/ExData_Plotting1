# read the source file
df <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",as.is=c(1:2))

# subset for dates 2007-02-01 and 2007-02-02
df <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]

# convert date and time variables
datetime <- strptime(paste(df[,1],df[,2]),"%d/%m/%Y %T")
df <- cbind(datetime,df)

# create plots and send to png device (use default width/height of 480x480)
png(filename="plot4.png")

# set canvas for mutiple plots
par(mfrow = c(2, 2))
with(df, {
        plot(Global_active_power~datetime, type = "l",ylab = "Global Active Power", xlab="")
        plot(Voltage~datetime, type = "l")
        plot(Sub_metering_1 ~ datetime, type = "l",ylab = "Energy sub metering", xlab="")
        lines(Sub_metering_2 ~ datetime, col="red")
        lines(Sub_metering_3 ~ datetime, col="blue")
        legend("topright", lty=1,col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(Global_reactive_power~datetime, type = "l")
})
dev.off()