## Getting full dataset
########################

df <- read.csv("./EDA_course/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

## Subsetting the data
########################
df_subset_dates <- subset(df, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(df)

## Converting dates
########################
df_conv_subset_dates <- paste(as.Date(df_subset_dates$Date), df_subset_dates$Time)
df_subset_dates$Datetime <- as.POSIXct(df_conv_subset_dates)

## Third Plot
########################
with(df_subset_dates, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save
########################
dev.copy(png, file="./EDA_course/EDA_C_W1/project/plot3.png", height=480, width=480)
dev.off()