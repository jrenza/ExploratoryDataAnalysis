cp1_load_data <- function() {
    
    #read in and create a data frame
    df <- data.frame(read.table('household_power_consumption.txt', header=T, sep=';', stringsAsFactors=FALSE, na.strings='?', colClasses=c('character', 'character', rep('numeric', 7))))

    df$Time <- strptime(paste(df$Date, df$Time), '%d/%m/%Y %H:%M:%S')
    df$Date <- as.Date(df$Date, '%d/%m/%Y')

    dates <- as.Date(c('2007-02-01', '2007-02-02'), '%Y-%m-%d')
    df <- subset(df, Date %in% dates)
    return(df)
}