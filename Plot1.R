library(dplyr)
#unzip("exdata_data_NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
#
# Select and convert data
Annual <- NEI %>% 
        group_by(year) %>% 
        summarise(total.Tons = sum(Emissions))
Annual <- Annual %>% mutate(total.kTons = round(total.Tons/10^3,2))
#
# Plot
x <- barplot(Annual$total.kTons, ylim = c(0,8000), names.arg = Annual$year, 
             xlab = "Time (Year)", ylab = "Annual Emissions (kTons)", main = 
                     expression("Annual PM"[2.5]*"Emissions"), col = 
                     c("red","green","blue","purple"))
text(x,Annual$total.kTons + 400, labels = as.character(Annual$total.kTons),
     cex = 0.8)
abline(h = mean(Annual$total.kTons, na.rm = TRUE), lwd = 2)
text(4.5,mean(Annual$total.kTons)+190, "Mean")
#
# Save file
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()