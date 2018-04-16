##KatherineStolin

getwd()
"/Users/katherinestolin"
filepath<- "/Users/katherinestolin/Desktop"
setwd(filepath)
getwd()
"/Users/katherinestolin/Desktop"

#in correct WD, now working with "Panel_8595.Txt"
task2data<- "Panel_8595.Txt"
Paneldata <- read.csv(task2data)

#exploring Paneldata
head(Paneldata)
dim(Paneldata)
summary(Paneldata)
class(Paneldata)
#unable to produce summary statistics because data needs cleaning 



