# (plot 6)
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# Use the source DownLoad_File.R to download the file, if the exists, comment the line
source("DownLoad_File.R")


#Verify if the file exists and read in a variable
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# Read the data for the variables: vhc, vhcSCC and vhcNEI.
vhc <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vhcSCC <- SCC[vhc,]$SCC
vhcNEI <- NEI[NEI$SCC %in% vhcSCC,]

# Read the data for the variables: vhcBtmNEI, vhcSCC and vhcNEI.
vhcBtmNEI <- vhcNEI[vhcNEI$fips=="24510",]
vhcBtmNEI$city <- "Baltimore City"

# Read the data with the filter (vhcNEI$fips=="06037")
vhclNEI <- vhcNEI[vhcNEI$fips=="06037",]
vhclNEI$city <- "Los Angeles County"

# Combine the two subsets (vhcBtmNEI,vhclNEI)
CombBothNEI <- rbind(vhcBtmNEI,vhclNEI)

# Make the plot
png("plot6.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

ggp2 <- ggplot(CombBothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(ggp2)

dev.off()