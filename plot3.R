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
plot_name <- "plot3.png"
width <- 480
height <- 480
xlab <- ""
ylab <- "Energy sub metering"
labels <- c('Thu', 'Fri', 'Sat') 
legend <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# read subset of file
data <- read.csv(filename, sep=";", header=TRUE, 
                 col.names=column_names, skip=rows_to_skip, nrows=rows_to_read)

# plot
png(filename=plot_name, width=width, height=height)
plot(data$sub_metering_1, xaxt="n", xlab=xlab, ylab=ylab, type="n")
lines(data$sub_metering_1)
lines(data$sub_metering_2, col = "red")
lines(data$sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "blue", "red"), 
       legend=legend )
axis(1, at=c(0, nrow(data)/2, nrow(data)), labels=labels)
dev.off()

