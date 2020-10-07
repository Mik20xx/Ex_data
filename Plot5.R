library(dplyr)
#unzip("exdata_data_NEI_data.zip")
#
NEI <- readRDS("summarySCC_PM25.rds")
#
# Select and convert data
data1 <- NEI %>% filter(fips == "24510" & type == "ON-ROAD")
Annual <- data1 %>% group_by(year) %>% 
        summarise(total.Tons = round(sum(Emissions),2))
#
# Plot
x <- barplot(Annual$total.Tons, ylim = c(0,380), 
             names.arg = Annual$year, xlab = "Time (Year)", 
             ylab = "Annual Emissions (Tons)", main = 
                     expression("Annual PM"[2.5]*"Emissions by motor vehicles"),
             col = c("red","purple","blue","green"))
text(x,Annual$total.Tons + 10, labels = as.character(Annual$total.Tons),
     cex = 0.8)
abline(h = mean(Annual$total.Tons, na.rm = TRUE), lty = 2,lwd = 2)
text(4.5,mean(Annual$total.Tons)+10, "Mean")
#
# Save file
dev.copy(png, "plot5.png", width = 480, height = 480)
dev.off()