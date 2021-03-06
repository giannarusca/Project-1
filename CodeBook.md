
# Task 1 CodeBook
## Data Collecton Information:
Task 1 used the raw data text files from: https://github.com/slevkoff/ECON386REPO/tree/master/Data%20Cleaning%20Project/Task%201

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years by UCI. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
H
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Variable | Description 
-------------- | ------------------------------------------------------ 
Subject | Number assigned to each of the 30 subjects 
Activity | Level of activity individual was doing during observation, coded in raw data as such: (1: WALKING, 2: WALKING_UPSTAIRDS, 3: WALKING_DOWNSTAIRS, 4: SITTING, 5: STANDING, 6: LAYING) 
t | time measurement
f | frequency measurement (HZ)
Body | relating to body motion (HZ)
Gravity | relating to the acceleration | SI)SI)
Acc |  relating to triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration (MPS)
Gyro |  relating to triaxial angular velocity from the gyroscope 
Jerk: | T relating to sudden movement, calculated using the body linear acceleration and angular velocity derived in time
Mag | magnitude of the three-dimensional signals, calculated using the Euclidean norm
mean() | Mean Value
std() | standard deviation  
meanFreq() | weighted average of the frequency components to obtain a mean frequency 



'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
The variables are composed of the abbreviations as such:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag



# Task 2 CodeBook
## Data Collecton Information:

Task 2 used the raw data text files from: https://github.com/slevkoff/ECON386REPO/blob/master/Data%20Cleaning%20Project/Task%202/Panel_8595.Txt 

Data was collected from coal-fired power plants from 1985-1995. The sample consists of 92 power plants.* 

Variable | Description | Units
-------------- | ------------------------------------- | -------------------  
Year | Year the sample was pooled | numeric
Plant | The number assoicated with the plant sampled  | numeric
Electricity | Electricity produced by plant, as a daily average | Megawatt hours (Mwh)
SO2 | Sulfur dioxide released, as a daily average | short tons
NO2 | Nitrogen dioxide released, as a daily average | short tons
Capital_Stock | Capital associated with plant | Dollars (in millions, 2017 dollars)
Employees | Workers at plant | numeric
Heat_coal | Heat content of coal, as a daily average | Megawatt hours (Mwh)
Heat_oil | Heat content of oil, as a daily average | Megawatt hours (Mwh)
Heat_gas | Heat content of gas, as a daily average | Megawatt hours (Mwh)
CAAP1 | indicates whether the Clean Air Act Phase I restrictions (1990) were announced yet or not | 0 = no, 1 = yes

*the data provided in __tidy2_a__ is the average of the variables across all years for each plant for the 11-year period. The data provided in __tidy2_b__ is the aggregate of each variable within a particular year across all 92 plants.
