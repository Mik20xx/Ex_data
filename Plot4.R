library(dplyr)
#unzip("exdata_data_NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#
# Select and convert data
data1 <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
data2 <- SCC[,data1 == TRUE]
alldata <- merge(NEI, data2, by.y = "SCC")
#
alldata2 <- alldata %>% select(Emissions,EI.Sector,year)
Annual <- alldata2 %>% group_by(year) %>% 
        summarise(Total.kTons=round(sum(Emissions)/10^3,2))
#
# Plot
x <- barplot(Annual$Total.kTons, ylim = c(0,600), 
             names.arg = Annual$year, xlab = "Time (Year)", 
             ylab = "Annual Emissions (kTons)", main = 
                     expression("Annual PM"[2.5]*"Emissions by coal combustion"),
                        col = c("red","purple","blue","green"))
text(x,Annual$Total.kTons + 20, labels = as.character(Annual$Total.kTons),
     cex = 0.8)
abline(h = mean(Annual$Total.kTons, na.rm = TRUE), lty = 2,lwd = 2)
text(4.5,mean(Annual$Total.kTons)+10, "Mean")
#
# Save file
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()