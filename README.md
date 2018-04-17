# Project-1
ECON 386 Group 1 

## Task 1 Transformations
Task 1 files consist of __Cleaning1.Rmd__, which includes the code for task 1, and __tidy1.txt__, which is the tidy dataset, with the variables and data described in the __Codebook.Rmd__

Task 1 used the raw data text files from: https://github.com/slevkoff/ECON386REPO/tree/master/Data%20Cleaning%20Project/Task%201
  The text files used are: __subject_test.txt, subject_train.txt, X_test.txt, X_train.txt, y_test.txt, y_train.txt,__ and __features.txt__.
  We downloaded these files to the desktop of the computer. It is important to know where the files are saved because this will alter the   file path used in line 11.

These files were importe into R using this code:
  filename <- read.table("~/Desktop/filename.txt")
  *The file path ("~/Desktop/...") may be different if you save the files in a different place. If so, Rstudio will bring back an error.     make sure you provide the right file path with reading the table.*

We changed the variable names for y_test, y_train, subject_test, and subject_train using colnames()
  For the subject_ dataframes, we changed the column name from "V1" to "Subject"
  For the y_ dataframes, we changed the column name from "V1" to "Activity"
    We used the following code:
    colnames(dataframe)[colnames(dataframe)=="oldcolumnname"] <- "newcolumnname"
    
We transposed the dataframe, features, so that it could be used as the column names for the X_ dataframes
  first, we created a new features dataframe, called features1:
    features1 <- features
  the first column of this dataframe does not provide meaningful data, so we removed it:
    features1$V1 = NULL
  to transpose the dataframe, we use t() and make it a new dataframe
    features2 <- t(features1)
    
We used the features2 dataframe to change the variable names of the X_ dataframes using the following code using colnames():
  X_test1 <- X_test 
  X_train1 <- X_train 
  colnames(X_test1) <- features2[1, ] 
  colnames(X_train1) <- features2[1, ]

We only wanted the standard deviation and the mean of the variables in the X_ dataframes, so we used grepl(), to create a logical argument that found "std" and "mean" and only kept those variables. The code use was:
  Varnames_test1 <- names(X_test1) 
    #Creates a vector of the variable names of X_test1 and label"Varnames_test1", labeled "Varnames_test1".
  Varnames_test2 <-  (grepl("mean", Varnames_test1 , fixed=TRUE)|grepl("std", Varnames_test1 , fixed=TRUE)) 
    #Creates a vector of the logic argument: if the variable includes "mean" or "std", True; if not, False, labeled "Varnames_test2".
  X_test2 <- X_test1[,Varnames_test2] 
     #Creates dataframe of X_test1 that contains only the columns from Varnames_test2 that are True, labeled "X_test2".
 
  Varnames_train1<- names(X_train1) 
     #Creates a vector of the variable names of X_train1, labeled"Varnames_train1".
  Varnames_train2 <- (grepl("mean", Varnames_train1 , fixed=TRUE)|grepl("std", Varnames_train1 , fixed=TRUE)) 
    #Creates vector of the logic argument: if the variable includes "mean" or "std", True; if not, False.
  X_train2 <-X_train1[,Varnames_train2]
    #Creates dataframe of X_train1 that contains only the columns from Varnames_train2 that are True, labeled "X_train2".
    
 We combined the test and the train dataframes as well as combine the rows. We also wanted to arrange the observations by Subject and Activity. We used cbind(), rbind(), and arrange() to accomplish this, as follows: 
   test <- cbind(subject_test, y_test, X_test2) 
      #Combines subject_test, y_test, and X_test2, labeled "test"
   train <- cbind(subject_train, y_train, X_train2)
      #Combines subject_train, y_train, and X_train2, labeled "train"
   Task1.1 <- rbind(train, test) 
      #Combines train and test, labled Task1.1. This is the merged dataframe.
    Task1.2 <- Task1.1 %>% arrange(Subject, Activity) 
      #Arranges the observations by Subject, then by Activity.

 We cleaned the Activity variable values from numerical code to descriptive activity names, using the following code:
   Task1.3 <- Task1.2 #Creates a new dataframe of Task1.2, labeled Task1.3
    Task1.3$Activity[Task1.3$Activity==1]<- "WALKING" 
      #Changes the value of the Activity from "1" to "WALKING".
    Task1.3$Activity[Task1.3$Activity==2]<- "WALKING_UPSTAIRS"
    Task1.3$Activity[Task1.3$Activity==3]<- "WALKING_DOWNSTAIRS"
    Task1.3$Activity[Task1.3$Activity==4]<- "SITTING"
    Task1.3$Activity[Task1.3$Activity==5]<- "STANDING"
    Task1.3$Activity[Task1.3$Activity==6]<- "LAYING"
    
 To create a new, independent tidy set with only the averages of each variable for each activity and each subject, we used the dplyr package, with the group_by and the summarise_all() functions:
    library(dplyr)
    Task1.4 <- Task1.2 %>% group_by(Subject, Activity) %>% summarise_all(funs(mean)) 
        #Create a new dataframe of Task1.2*, which is grouped by Subject, then by Activity, where the rest of the variables are the               average for each subject and activity.
        * Task1.2 is used instead of Task 1.3 in order to preserve the arrangement of activities.
 We added descriptive values for the Activity label for the new tidyset:
  Task1.4$Activity[Task1.4$Activity==1]<- "WALKING" 
      #Changes the value of the Activity from "1" to "WALKING"
  Task1.4$Activity[Task1.4$Activity==2]<- "WALKING_UPSTAIRS"
  Task1.4$Activity[Task1.4$Activity==3]<- "WALKING_DOWNSTAIRS"
  Task1.4$Activity[Task1.4$Activity==4]<- "SITTING"
  Task1.4$Activity[Task1.4$Activity==5]<- "STANDING"
  Task1.4$Activity[Task1.4$Activity==6]<- "LAYING"
We saved the new tidy set, __Task1.4__, using write.table(), as __tidy1.txt__
    write.table(Task1.4, "tidy1.txt", row.names=F, col.names=T, sep="\t", quote=F) 
