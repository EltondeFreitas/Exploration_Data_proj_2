# (plot 4)
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# Use the source DownLoad_File.R to download the file, if the exists, comment the line
source("DownLoad_File.R")


#Verify if the file exists and read in a variable
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# Read the data for the variables: combRel,coRel,coComb,combSCC and combNEI
combRel <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coRel <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coComb <- (combRel & coRel)
combSCC <- SCC[coComb,]$SCC
combNEI <- NEI[NEI$SCC %in% combSCC,]

# Make the plot
png("plot4.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

ggp2 <- ggplot(combNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(ggp2)

dev.off()