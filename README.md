Criteria

The zip file contains two files:

PM2.5 Emissions Data summarySCC_PM25.rds: This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. 
For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.


Variables:

fips: A five-digit number (represented as a string) indicating the U.S. county
SCC: The name of the source as indicated by a digit string (see source code classification table)
Pollutant: A string indicating the pollutant
Emissions: Amount of PM2.5 emitted, in tons
type: The type of source (point, non-point, on-road, or non-road)
year: The year of emissions recorded

Questions and Answers
You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot.
 
1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
Ans: Yes, The emissions in 2008 (3464.21 kiloTons) is lower that in 1999 (7332.97 kiloTons). [Plot1.png]  

2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
Ans: Yes, The emissions in 1999 is 3274.18 Tons, in 2008 is 1862.28 Tons. There is a decrease. [Plot2.png] 

3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
Ans: Three types decreased (NON-ROAD, NONPOINT, ON_ROAD) and one type increased (POINT). [Plot3.png] 

4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
Ans: The difference between the emissions from coal combustion-related sources in 1999 (572.13 kiloTons) and 2008 (343.43 kiloTons) is 228.7 kiloTons. there is a decrease. [Plot4.png]
 
5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
Ans: The difference between the emissions from motor vehicle sources in 1999 (346.82 Tons) and 2008 (88.28 Tons) is 258.54 Tons. [Plot5.png]

6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
Ans: The 1999 Baltimore emission is 346.82 Tons and 2008 is 88.28 Tons, there is a decrease of 258.54 Tons. The 1999 Los Angeles emission is 3931.12 Tons and 2008 is 4101.32 Tons, there is a increase of 170.2 Tons. Los Angeles emission has greater than in Baltimore City

Thanks
