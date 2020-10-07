library(dplyr)
library(ggplot2)
#unzip("exdata_data_NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
#
NEI_Baltimore <- NEI %>% filter(fips == "24510")
#
# Select and convert data
Annual <- NEI_Baltimore %>% 
        group_by(year,type) %>% 
        summarise(total.Tons = round(sum(Emissions),2))
#
# Plot
g <- ggplot(Annual, aes(x= as.factor(year), y=total.Tons, 
                        fill = type, label = total.Tons))
g + geom_bar(stat = "identity") + facet_grid(.~type) +
        xlab("Year") + ylab("Annual Emissions(Tons)") +
        ggtitle(expression("Annual PM"[2.5]*"Emissions - Baltimore")) +
        theme(plot.title = element_text(hjust = 0.5)) +
        geom_label(aes(fill = type))
#
# Save file
dev.copy(png, "plot3.png", width = 1024, height = 480)
dev.off()