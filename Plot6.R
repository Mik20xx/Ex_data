library(dplyr)
#unzip("exdata_data_NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
#
data1 <- NEI %>% filter(fips == "24510" | fips == "06037")
data1 <- data1 %>% filter(type == "ON-ROAD")
#
# Select and convert data
Annual <- data1 %>% 
        group_by(fips, year) %>% 
        summarise(Total.Tons = round(sum(Emissions),2))
#
Annual.Baltimore <- Annual %>% filter(fips == "24510")
Annual.LAngeles <- Annual %>% filter(fips == "06037")
#
# Plot
par(mfcol=c(2,1))
# First plot
x1 <- barplot(Annual.Baltimore$Total.Tons, ylim = c(0,400), 
             names.arg = Annual.Baltimore$year, xlab = "Time (Year)", 
             ylab = "Annual Emissions (Tons)", main = 
                     expression("Annual PM"[2.5]*"Emissions from Motor vehicles - Baltimore"),
             col = c("red","purple","blue","green"))
text(x1,Annual.Baltimore$Total.Tons + 10, 
     labels = as.character(Annual.Baltimore$Total.Tons), cex = 0.8)
abline(h = mean(Annual.Baltimore$Total.Tons, na.rm = TRUE),lwd = 2, lty = 2)
text(4.5,mean(Annual.Baltimore$Total.Tons)+10, "Mean")
#
# Second plot
x2 <- barplot(Annual.LAngeles$Total.Tons, ylim = c(0,5000), 
              names.arg = Annual.LAngeles$year, xlab = "Time (Year)", 
              ylab = "Annual Emissions (Tons)", main = 
                      expression("Annual PM"[2.5]*"Emissions from Motor vehicles - Los Angeles"),
              col = c("red","purple","blue","green"))
text(x1,Annual.LAngeles$Total.Tons + 200, 
     labels = as.character(Annual.LAngeles$Total.Tons), cex = 0.8)
abline(h = mean(Annual.LAngeles$Total.Tons, na.rm = TRUE),lwd = 2, lty = 2)
text(3,mean(Annual.LAngeles$Total.Tons)+200, "Mean")
#
# Save file
dev.copy(png, "plot6.png", width = 480, height = 1024)
dev.off()