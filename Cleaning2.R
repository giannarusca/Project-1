##assigning "task2data" variable to csv of task 2 data
filepath<- "/Users/katherinestolin/Desktop"
setwd(filepath)
getwd()
"/Users/katherinestolin/Desktop"

##imported .txt file into excel and saved as .csv
##deleted row 1 because it was superfluous 
task2<- "task2data.csv"
task2data <- read.csv(task2)

##exploratory
View(task2data)

##load packages
library(plyr)
library(dplyr)
library(ggplot2)

##rename variables 
names(task2data) <- c("x", "x.1","x.2", "x.3", "x.4", "x.5", "x.6", "x.7", "x.8", "x.9", "x.10", "x.11", "x.12")

##remove unecessary column 
task2data$x.1 = NULL

##rename first two columns to "Plant" and "Year"
colnames(task2data)[colnames(task2data)=="x"] <- "Plant"
colnames(task2data)[colnames(task2data)=="x.2"] <- "Year"

##Find means of each column to match variable names to columns 
means <- ddply(task2data, "x.3", summarise, meanx.3=mean(x.3))
means

##Renaming Elecricity column 
colnames(task2data)[colnames(task2data)=="x.3"] <- "Electricity"

##Continue finding means and changing names of remaining columns in same manor 
means <- ddply(task2data, "Year", summarise, meanx.4=mean(x.4))
means
colnames(task2data)[colnames(task2data)=="x.4"] <- "SO2"

means <- ddply(task2data, "Year", summarise, meanx.5=mean(x.5))
colnames(task2data)[colnames(task2data)=="x.5"] <- "NOx"

means <- ddply(task2data, "Year", summarise, meanx.6=mean(x.6))
means
colnames(task2data)[colnames(task2data)=="x.6"] <- "Capital_Stock"

means <- ddply(task2data, "Year", summarise, meanx.7=mean(x.7))
means
colnames(task2data)[colnames(task2data)=="x.7"] <- "Employees"

means <- ddply(task2data, "Year", summarise, meanx.8=mean(x.8))
means
colnames(task2data)[colnames(task2data)=="x.8"] <- "Heat_coal"

means <- ddply(task2data, "Year", summarise, meanx.9=mean(x.9))
means
colnames(task2data)[colnames(task2data)=="x.9"] <- "Heat_oil"

means <- ddply(task2data, "Year", summarise, meanx.10=mean(x.10))
means
colnames(task2data)[colnames(task2data)=="x.10"] <- "Heat_gas"

##remove unecessary columns 
task2data$x.11 = NULL
task2data$x.12 = NULL

##Write new table
write.table(task2data, "task2data.txt", row.names=F, col.names=T, sep="\t", quote=F)

##Create a new data frame for task2data to convert measurements 
task2data.1 <- task2data 

###convert the energy measurements of Electricity, Heat_coal,Heat_oil and Heat_gas into Mwh and daily averages
task2data.1$Electricity <- (task2data$Electricity*0.001)/365
task2data.1$Heat_coal <- (task2data$Heat_coal*0.00000029)/365
task2data.1$Heat_oil <- (task2data$Heat_oil*0.00000029)/365
task2data.1$Heat_gas <- (task2data$Heat_gas*0.00000029)/365

##convert the pollutant qualities of SO2 and NOx into daily averages 
task2data.1$SO2 <- (task2data.1$SO2)/365
task2data.1$NOx <- (task2data.1$NOx)/365

##convert the Capital_Stock from 1973 US dollars to 2017 US dollars
task2data.1$Capital_Stock <-(task2data$Capital_Stock*4.513)

##create a binary variable which indicates if the Clean Air Act Phase I restrictions had been announced yet (1=yes, 0=no)
task2data.1$CAAP1 <- as.numeric(task2data$Year>=90)

##save the tidy set as "tidy2.txt"
write.table(task2data.1, "tidy2.txt", row.names=F, col.names=T, sep="\t", quote=F)

##create a subset of Panel_8595.1 which averages all of the variables across all years for each plant for the 11 year period, called Panel_8595.2a
Panel_8595.2a <- task2data.1 %>% group_by(Plant) %>% summarise_all(funs(mean))

###save the tidy set as "tidy2_a.txt"
write.table(Panel_8595.2a, "tidy2_a.txt", row.names=F, col.names=T, sep="\t", quote=F)

##create a subset of Panel_8595.1 which adds all of the variables within a particular year across all 92 plants, called Panel_8595.2b
Panel_8595.2b <- task2data.1 %>% group_by(Year) %>% summarise_all(funs(sum))

##save the tidy set as "tidy2_b.txt"
write.table(Panel_8595.2b, "tidy2_b.txt", row.names=F, col.names=T, sep="\t", quote=F)

