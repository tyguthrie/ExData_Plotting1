# read the source file
df <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",as.is=c(1:2))

# subset for dates 2007-02-01 and 2007-02-02
df <- df[df$Date=="1/2/2007" | df$Date=="2/2/2007",]

# create histogram and send to png device (use default width/height of 480x480)
png(filename="plot1.png")
hist(df$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
