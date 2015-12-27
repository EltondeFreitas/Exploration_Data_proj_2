# (plot 5)
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

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

# Read the data with the filter (vhcNEI$fips=="24510")
btmVhcNEI <- vhcNEI[vhcNEI$fips=="24510",]

# Make the plot
png("plot5.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

ggp2 <- ggplot(btmVhcNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp2)

dev.off()