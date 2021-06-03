# load data
df <- read.table('household_power_consumption.txt', header=TRUE, sep=';')

# convert to data format
df$Date <- as.Date(df$Date, format='%d/%m/%Y')


# select only from 2007-02-01 to 2007-02-02
df_sub <- subset(df, Date >= as.Date('2007-02-01', format ='%Y-%m-%d')
                 & Date <= as.Date('2007-02-02', format ='%Y-%m-%d'))

with(df_sub, hist(as.numeric(Global_active_power), col = 'red', 
     xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power'))
dev.copy(png, 'plot1.png', width = 480, height = 480)
dev.off()