---
output:
  html_document: default
  pdf_document: default
---
# Task 1 CodeBook
## Data Collecton Information:
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years by UCI.Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
H
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Variable | Description 
-------------- | ------------------------------------------------------ 
Subject | Number assigned to each of the 30 subjects 
Activity | Level of activity individual was doing during observation (WALKING, WALKING_UPSTAIRDS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
t | time measurement
f | frequency measurement (HZ)
Body | relating to body motion (HZ)
Gravity | relating to the acceleration (| SI)SI)
Acc |  relating to triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration (MPS)
Gyro |  relating to triaxial angular velocity from the gyroscope 
Jerk: | T relating to sudden movement, calculated using the body linear acceleration and angular velocity derived in time
Mag | magnitude of the three-dimensional signals, calculated using the Euclidean norm
mean() | Mean Value
std() | standard deviation  
meanFreq() | weighted average of the frequency components to obtain a mean frequency 



'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
The variables are composed of the abbreviations as such:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag



# Task 2 CodeBook
## Data Collecton Information:
Data from coal-fired power plants from 1985-1995. The sample consists of 92 power plants. 

Variable | Description | Units
-------------- | ------------------------------------- | -------------------  
Year | Year the sample was pooled | numeric
Plant | The number assoicated with the plant sampled  | numeric
Electricity | Electricity produced by plant | kWh(millions)
SO2 | Sulfur dioxide released | short tons
NO2 | Nitrogen dioxide released | short tons
Capital stock | Capital associated with plant | Dollars (in millions, 1973 dollars)
Employees | Workers at plant | numeric
Heat_coal | Heat content of coal | Btu (billions)
Heat_oil | Heat content of oil | Btu (billions)
CAAP1 | dummy variable for Clean Air Action Plan law | 0 = no, 1 = yes

