# (plot 3)
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
# Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Use the source DownLoad_File.R to download the file, if the exists, comment the line
source("DownLoad_File.R")


#Verify if the file exists and read in a variable
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# Read the data with the filter (NEI$fips=="24510")
btmNEI <- NEI[NEI$fips=="24510",]


# Make the plot
png("plot3.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

# Make the Aggregate in the variable ggp2
ggp2 <- ggplot(btmNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp2)

dev.off()