# load data
df <- read.table('household_power_consumption.txt', header=TRUE, sep=';')

# convert to data format
df$Date <- as.Date(df$Date, format='%d/%m/%Y')


# select only from 2007-02-01 to 2007-02-02
df_sub <- subset(df, Date >= as.Date('2007-02-01', format ='%Y-%m-%d')
                 & Date <= as.Date('2007-02-02', format ='%Y-%m-%d'))

# plot2
df_sub$Time <- strptime(paste(df_sub$Date, df_sub$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
with(df_sub, plot(Time, as.numeric(Global_active_power), 
                  ylab='Global Active Power (kilowatts)', type = 'l', lwd=1, xlab=''))
dev.copy(png, 'plot2.png', width = 480, height = 480)
dev.off()
