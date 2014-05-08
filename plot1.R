setwd('/Users/bakebrain/src/ExData_Plotting1/')

# after reading in the whole dataset once we get only the rows we need

#> min(which(data$Date == "31/1/2007"))
#[1] 66636

#> max(which(data$Date == "2/2/2007"))
#69[1] 69516

#> 69516 - 66636
#[1] 2880

# dataset settings
filename <- "household_power_consumption.txt"
rows_to_read <- 2880
rows_to_skip <- 66636
column_names <- c("date", "time", "global_active_power", 
                  "global_reactive_power", "voltage", "global_intensity", 
                  "sub_metering_1", "sub_metering_2", "sub_metering_3")
# plot settings
plot_name <- "plot1.png"
width <- 480
height <- 480
main <- "Global Active Power"
xlab <- "Global Active Power (kilowatts)"
col <- "red"

# read subset of file
data <- read.csv(filename, sep=";", header=TRUE, 
                 col.names=column_names, skip=rows_to_skip, nrows=rows_to_read)

# plot
png(filename=plot_name, width=width, height=height)
hist(data$global_active_power, col=col, main=main, xlab=xlab)
dev.off()

