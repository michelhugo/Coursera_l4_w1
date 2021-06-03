# load data
df <- read.table('household_power_consumption.txt', header=TRUE, sep=';')

# convert to data format
df$Date <- as.Date(df$Date, format='%d/%m/%Y')


# select only from 2007-02-01 to 2007-02-02
df_sub <- subset(df, Date >= as.Date('2007-02-01', format ='%Y-%m-%d')
                 & Date <= as.Date('2007-02-02', format ='%Y-%m-%d'))

# plot3
df_sub$Time <- strptime(paste(df_sub$Date, df_sub$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
with(df_sub, plot(Time, as.numeric(Sub_metering_1), 
                  ylab='Energy sub metering', type = 'l', lwd = 1, xlab=''))
lines(df_sub$Time, as.numeric(df_sub$Sub_metering_2), col = 'red')
lines(df_sub$Time ,df_sub$Sub_metering_3, col = 'blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=1, col=c("black", "red", "blue"))
dev.copy(png, 'plot3.png', width = 480, height = 480)
dev.off()
