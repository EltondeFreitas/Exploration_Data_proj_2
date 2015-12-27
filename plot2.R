# (plot 2)
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# Use the source DownLoad_File.R to download the file, if the exists, comment the line
source("DownLoad_File.R")

#Verify if the file exists and read in a variable
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

#Read the variable with a filter (fips == "24510") 
subsetNEI  <- NEI[NEI$fips=="24510", ]

#Make the agregate 
agrtTotBYear <- aggregate(Emissions ~ year, subsetNEI, sum)

#make the plot
png('plot2.png')
barplot(height=agrtTotBYear$Emissions, names.arg=agrtTotBYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()