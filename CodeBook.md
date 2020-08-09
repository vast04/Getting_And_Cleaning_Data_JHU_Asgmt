About the Data
==============

The data was  processed by the script 'run_analysis.R' to create the 'data_mean' table.
The scripts were executed in RStudio (version 4.0.2)
The library 'dplyr' was used.


Steps involved in making the tidy data set (data_mean):
=======================================================

1. Train and test data were merged.
    - To get the train data, UCI HAR Dataset/train/subject_train.txt, UCI HAR Dataset/train/X_train.txt and UCI HAR Dataset/train/y_train.txt were combined using  cbind.
    - To get the test data, UCI HAR Dataset/test/subject_test.txt, UCI HAR Dataset/test/X_test.txt and UCI HAR Dataset/test/y_test.txt were binded using cbind.
    - These data sets were then merged using rbind.
    
2. Extraction of only the measurements on the mean and standard deviation for each measurement.
     
3. Uses descriptive activity names to name the activities in the data set.
    - Replace the variable about activity, that contains integers from 1 to 6, with a factor based on levels and labels contained in the 'activity_labels' data file.

4. Appropriately labels the data set with target variables with appropriate names.
    - Extracts the target variable names from 'features.txt'.
    - Creates a new tidy dataset with the appropriate labels for the variable names.
    
5. First the dataset was grouped by 'Subject' and 'Activity' then using summarise from dplyr package to find the mean of each variable.
    - The table data_mean is the required dataset.
    
    
    
    

Feature Selection 
=================


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

