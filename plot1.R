# (plot 1)
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources
# for each of the years 1999, 2002, 2005, and 2008.

# Use the source DownLoad_File.R to download the file, if the exists, comment the line
source("DownLoad_File.R")

#Verify if the file exists and read in a variable
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

#make the agregate for each year
agrtTotBYear <- aggregate(Emissions ~ year, NEI, sum)

#make the plot
png('plot1.png')
barplot(height=(agrtTotBYear$Emissions)/10^6, names.arg=agrtTotBYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()
