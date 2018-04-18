# Project-1
ECON 386 Group 1 

## TASK 1 DOCUMENTATION OF THE CLEANING PROCESS AND RELATED FILES
Task 1 files consist of __Cleaning1.Rmd__, which includes the code for the transformation of the raw data to the tidy dataset, and __tidy1.txt__, which is the tidy dataset, with the variables and data described in the __Codebook.Rmd__

Task 1 used the raw data text files from: https://github.com/slevkoff/ECON386REPO/tree/master/Data%20Cleaning%20Project/Task%201
  
  The text files used are: __subject_test.txt, subject_train.txt, X_test.txt, X_train.txt, y_test.txt, y_train.txt,__ and __features.txt__.
  
  We downloaded these files to the desktop of the computer. It is important to know where the files are saved because this will alter the   file path.

### These files were imported into R using this code:
 ```{r} 
  filename <- read.table("~/Desktop/filename.txt")
```
  The file path may be different if you save the files in a different place. If so, Rstudio will bring back an error.     make sure you provide the right file path with reading the table.

### We changed the variable names for y_test, y_train, subject_test, and subject_train using colnames()
 For the subject_ dataframes, we changed the column name from "V1" to "Subject"
  For the y_ dataframes, we changed the column name from "V1" to "Activity"
    We used the following code:
 ```{r} 
    colnames(dataframe)[colnames(dataframe)=="oldcolumnname"] <- "newcolumnname"
```  
### We transposed the dataframe, features, so that it could be used as the column names for the X_ dataframes
  
  first, we created a new features dataframe, called features1:
  ```{r}
    features1 <- features
  ```
  the first column of this dataframe does not provide meaningful data, so we removed it:
  ```{r}
    features1$V1 = NULL
  ```
  to transpose the dataframe, we use t() and make it a new dataframe
  ```{r}
    features2 <- t(features1)
 ```
    
### We used the features2 dataframe to change the variable names of the X_ dataframes using the following code using colnames():
   ```{r} 
  X_test1 <- X_test 
  colnames(X_test1) <- features2[1, ]
  ```
  Repeat for X_train

### We only wanted the standard deviation and the mean of the variables in the X_ dataframes, so we used grepl(), to create a logical argument that found "std" and "mean" and only kept those variables. The code use was:
  Create a vector of the variable names of X_test1 and label"Varnames_test1", labeled "Varnames_test1".
```{r}
  Varnames_test1 <- names(X_test1) 
```
  Create a vector of the logic argument: if the variable includes "mean" or "std", True; if not, False, labeled "Varnames_test2".
```{r}
  Varnames_test2 <-  (grepl("mean", Varnames_test1 , fixed=TRUE)|grepl("std", Varnames_test1 , fixed=TRUE)) 
```
Creates dataframe of X_test1 that contains only the columns from Varnames_test2 that are True, labeled "X_test2".
```{r}
  X_test2 <- X_test1[,Varnames_test2] 
```
Repeat for X_train
    
### We combined the test and the train dataframes as well as combine the rows. We also wanted to arrange the observations by Subject and Activity. We used cbind(), rbind(), and arrange() to accomplish this, as follows:
Combine subject_test, y_test, and X_test2, labeled "test"
 ```{r} 
   test <- cbind(subject_test, y_test, X_test2) 
```
Repeat for train dataframes, label "train"
Combine train and test, labled Task1.1. This is the merged dataframe.
```{r}
  Task1.1 <- rbind(train, test) 
```
 Arrange the observations by Subject, then by Activity.
 ```{r}
  Task1.2 <- Task1.1 %>% arrange(Subject, Activity)
  ```
 
 

### We cleaned the Activity variable values from numerical code to descriptive activity names. The variable was coded 1 through 6, with the respective descriptive values: "WALKING", "WALKING_UPSTAIRS", "WALKING DOWNSTAIRS", "SITTING", "STANDING", AND "LAYING" using the following code:
 Change the value of the Activity from "1" to "WALKING".
 ```{r}
   Task1.3 <- Task1.2 #Creates a new dataframe of Task1.2, labeled Task1.3
   Task1.3$Activity[Task1.3$Activity==1]<- "WALKING"
 ```
   Repeat for 2 through 6
    
### To create a new, independent tidy set with only the averages of each variable for each activity and each subject, we used the dplyr package, with the group_by and the summarise_all() functions:
Create a new dataframe of Task1.2*, which is grouped by Subject, then by Activity, where the rest of the variables are the               average for each subject and activity.
```{r}
    library(dplyr)
    Task1.4 <- Task1.2 %>% group_by(Subject, Activity) %>% summarise_all(funs(mean))
```
* Task1.2 is used instead of Task 1.3 in order to preserve the arrangement of activities.
### We added descriptive values for the Activity label for the new tidyset:
  Change the value of the Activity from "1" to "WALKING"; same process used as in Task 1.3, repeat for 2 through 6.
  ```{r} 
  Task1.4$Activity[Task1.4$Activity==1]<- "WALKING"   
  ```
### We saved the new tidy set, __Task1.4__, using write.table(), as __tidy1.txt__
    write.table(Task1.4, "tidy1.txt", row.names=F, col.names=T, sep="\t", quote=F) 
    
## TASK 2 DOCUMENTATION OF THE CLEANING PROCESS AND RELATED FILES
Task 2 files consist of __Cleaning2.R__, which includes the code for the transformation of the raw data to the tidy dataset, and __tidy2.txt__,__tidy2_a.txt__, and __tidy2_b.txt__, which are the tidy datasets, with the variables and data described in the __Codebook.Rmd__

Task 2 used the raw data text files from: https://github.com/slevkoff/ECON386REPO/blob/master/Data%20Cleaning%20Project/Task%202/Panel_8595.Txt 
  
  The text file used is: __Panel_8595.txt__.
  We downloaded this file to the desktop of the computer. It is important to know where the file is saved because this will alter the   file path.

### These files were imported into R using this code*:
 ```{r} 
  task2data <- read.table("~/Desktop/Panel_8595.txt", skip=2)
```
*The file path may be different if you save the files in a different place. If so, Rstudio will bring back an error. Make sure you provide the right file path with reading the table. "skip=2" is used to remove unnecessary headers in the text file.

### We first loaded the necessary packages, they may need to be installed first:
```{r}
library(plyr)
library(dplyr)
library(ggplot2)
```
### We renames the columns
```{r}
names(task2data) <- c("x", "x.1","x.2", "x.3", "x.4", "x.5", "x.6", "x.7", "x.8", "x.9", "x.10", "x.11", "x.12")
```
### We removed an unnecessary column
```{r}
task2data$x.1 = NULL
```
### We renamed the first two columns
```{r}
colnames(task2data)[colnames(task2data)=="x"] <- "Plant"
colnames(task2data)[colnames(task2data)=="x.2"] <- "Year"
```
### In order to rename the other variables, we needed to find the means by year and compare to the paper concerning the data:
```{r}
means <- ddply(task2data, "x.3", summarise, meanx.3=mean(x.3))
means
```
we renamed the column with the corresponding variable name
```{r}
colnames(task2data)[colnames(task2data)=="x.3"] <- "Electricity"
```
The process was repeated for: 
* x.4 -> "SO2"
* x.5 -> "NOx"
* x.6 -> "Capital_Stock"
* x.7 -> "Employees"
* x.8 -> "Heat_coal"
* x.9 -> "Heat_oil"
* x.10 -> "Heat_gas"

### We removed x.11 and x.12 because they did not contain necessary information for this project:
```{r}
task2data$x.11 = NULL
task2data$x.12 = NULL
```
### This dataset was save as a table, using write.table()
```{r}
write.table(task2data, "task2data.txt", row.names=F, col.names=T, sep="\t", quote=F)
```
### New dataframe was created before converting the measurements of the variables
```{r}
task2data.1 <- task2data 
```
### We converted the energy measurements for __Electricity__,__Heat_coal__,__Heat_oil__, and __Heat_gas__ into Mwh and daily averages
```{r}
task2data.1$Electricity <- (task2data$Electricity*0.001)/365
task2data.1$Heat_coal <- (task2data$Heat_coal*0.00000029)/365
task2data.1$Heat_oil <- (task2data$Heat_oil*0.00000029)/365
task2data.1$Heat_gas <- (task2data$Heat_gas*0.00000029)/365
```
*we used the conversions: 1 kwh = 0.001 Mwh and 1 btu = 0.00000029 Mwh

### We converted the pollutant qualities of SO2 and NOx as daily averages
```{r}
task2data.1$SO2 <- (task2data.1$SO2)/365
task2data.1$NOx <- (task2data.1$NOx)/365
```
### We created  a binary variable which indicates if the Clean Air Act Phase I restrictions had been announced yet (1=yes, 0=no)
```{r}
task2data.1$CAAP1 <- as.numeric(task2data$Year>=90)
```
### We saved this tidy set as __"tidy2.txt"__
```{r}
write.table(task2data.1, "tidy2.txt", row.names=F, col.names=T, sep="\t", quote=F)
```
### We created a subset of Panel_8595.1 which averages all of the variables across all years for each plant for the 11 year period, called Panel_8595.2a
```{r}
Panel_8595.2a <- task2data.1 %>% group_by(Plant) %>% summarise_all(funs(mean))
```
### We saved this dataset as "tidy2_a.txt"
```{r}
write.table(Panel_8595.2a, "tidy2_a.txt", row.names=F, col.names=T, sep="\t", quote=F)
```

### We created a subset of Panel_8595.1 which adds all of the variables within a particular year across all 92 plants, called Panel_8595.2b
```{r}
Panel_8595.2b <- task2data.1 %>% group_by(Year) %>% summarise_all(funs(sum))
```
### We saved this dataset as "tidy2_b.txt"
```{r}
write.table(Panel_8595.2b, "tidy2_b.txt", row.names=F, col.names=T, sep="\t", quote=F)
```
