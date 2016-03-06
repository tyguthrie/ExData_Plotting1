# read the source file
df <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",as.is=c(1:2))

# subset for dates 2007-02-01 and 2007-02-02
df <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]

# convert date and time variables
datetime <- strptime(paste(df[,1],df[,2]),"%d/%m/%Y %T")
df <- cbind(datetime,df)

# create plot and send to png device (use default width/height of 480x480)
png(filename="plot2.png")
plot(df$Global_active_power~df$datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab="",main = "Global Active Power (kilowatts)")
dev.off()