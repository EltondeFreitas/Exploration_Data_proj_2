#Download the file

#Create link
vlink <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

# "./" is the path of my machine, ex.: "("C:/Users/xxx/Documents/"
dfile <-"./coursera/Exploratory Data Analysis/data/FNEI_data.zip"

#download file
download.file(vlink,destfile = dfile,method = "auto")

# set the directory work
setwd("./coursera/Exploratory Data Analysis/data")

#unzip the file
if (file.exists("./FNEI_data.zip")) { 
  unzip("FNEI_data.zip",exdir = ".") 
}