# Code Book for ds_tidy1 and ds_tidy2 tidy datasets

## Introduction

This Code Book describes the variables contained in ds_tidy1 and ds-tidy2 datasets, as well as the process performed to clean and transform data to this final format.

## 1. The RAW DATA
The raw data used for this analysis was obtained from the UCI Machine Learning Repository on an experiment that collected movement data from the sensor signals (accelerometer and gyroscope) of a Samsung Galaxy S II device used in a group of 30 volunteers.
The input raw data files for the script can be downloaded using the following link: 
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For further details regarding information on raw data files and how they were collected, please refer to the following link:
* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

A total of 8 RAW DATA files, as follows, were used in this analysis:

  1.1 **UCI HAR Dataset/train/X_train.txt**
  Measurements of all activities for volunteer subjects from the “train” group, with results for it’s 561 distinct variables.

  1.2 **UCI HAR Dataset/train/subject_train.txt**
  The volunteer’s Id for each measurement of the item 1.1 file. 

  1.3 **UCI HAR Dataset/train/y_train.txt**
  The activity code for each measurement of the item 1.1 file.

  1.4 **UCI HAR Dataset/test/X_test.txt**
  Measurements of all activities for volunteer subjects from the “test” group, with results for it’s 561 distinct variables.

  1.5 **UCI HAR Dataset/test/subject_test.txt**
  The volunteer’s Id for each measurement of the item 1.4 file.

  1.6 **UCI HAR Dataset/test/y_test.txt**
  The activity code for each measurement of the item 1.4 file.

  1.7 **UCI HAR Dataset/features.txt**
  The short description of each measurement variable present in the item 1.1 and 1.4 files.

  1.8 **UCI HAR Dataset/activity_labels.txt**
  The description of each activity code declared in the activity files of item 1.3 and 1.6.



## 2. Data Processing and Transformation

### ds_tidy1

In the first tidy dataset, all collected data was consolidated in 1 dataset and only the relevant data for this analysis (means and standard deviations) was maintained, according to the processing steps below:

  2.1 Activity description (item 1.8) was added to all activity codes of train and test groups (items 1.3 and 1.6), being the activity code it self the selection criteria.

  2.2 A consolidated dataset was created for the training group, containing the variables volunteer id (item 1.2), activity code and description (according to item 2.1) and all the movement measurements (item 1.1). The consolidation criteria was to match the same line position in each file.

  2.3 A consolidated dataset was created for the test group, containing the variables volunteer id (item 1.5), activity code and description (according to item 2.1) and all the movement measurements (item 1.4). The consolidation criteria was to match the same line position in each file.

  2.4 The measurement variable’s were labeled according to the variables description in item 1.7.

  2.5 A complete consolidated dataset was created, with all observations (lines) of group train (item 2.2) and all observations of group test (item 2.3) in the same dataset.

  2.6 Finally, the dataset ds_tidy1 was created based in the complete dataset (item 2.5), maintaining only the variables that contained “mean” and “std” in their names/labels, that is, only the measurements on the mean and standard deviation. 

### ds_tidy2

In the second tidy dataset, the mean of each movement variable of ds_tidy1 (item 2.6) was calculated for each unique combination of volunteer id and activity. This is the final tidy dataset that the script outputs to the “tidy2.txt” file.


## 3. Variable’s description

**SubjectId** - Unique id number for each one of the 30 volunteer subjects used in measurements

**ActivityCode** - Unique activity code:
   1 - WALKING
   2 - WALKING_UPSTAIRS
   3 - WALKING_DOWNSTAIRS
   4 - SITTING
   5 - STANDING
   6 - LAYING

**ActivityName** - Activity description for respective activity code
                   
**tBodyAcc.mean…X** - Mean value of Body Accelerometer signal in time domain for X-axis

**tBodyAcc.mean…Y** - Mean value of Body Accelerometer signal in time domain for Y-axis

**tBodyAcc.mean…Z** - Mean value of Body Accelerometer signal in time domain for Z-axis
              
**tGravityAcc.mean…X** - Mean value of Gravity Accelerometer signal in time domain for X-axis

**tGravityAcc.mean…Y** - Mean value of Gravity Accelerometer signal in time domain for Y-axis

**tGravityAcc.mean…Z** - Mean value of Gravity Accelerometer signal in time domain for Z-axis
           
**tBodyAccJerk.mean…X** - Mean value of Body Accelerometer Jerk signal in time domain for X-axis

**tBodyAccJerk.mean…Y** - Mean value of Body Accelerometer Jerk signal in time domain for Y-axis

**tBodyAccJerk.mean…Z** - Mean value of Body Accelerometer Jerk signal in time domain for Z-axis

**tBodyGyro.mean…X** - Mean value of Body Gyroscope signal in time domain for X-axis

**tBodyGyro.mean…Y** - Mean value of Body Gyroscope signal in time domain for Y-axis

**tBodyGyro.mean…Z** - Mean value of Body Gyroscope signal in time domain for Z-axis

**tBodyGyroJerk.mean…X** - Mean value of Body Gyroscope Jerk signal in time domain for X-axis

**tBodyGyroJerk.mean…Y** - Mean value of Body Gyroscope Jerk signal in time domain for Y-axis

**tBodyGyroJerk.mean…Z** - Mean value of Body Gyroscope Jerk signal in time domain for Z-axis

**tBodyAccMag.mean..** - Mean value of Body Accelerometer signal’s Magnitude in time domain

**tGravityAccMag.mean..** - Mean value of Gravity Accelerometer signal Magnitude in time domain

**tBodyAccJerkMag.mean..** - Mean value of Body Accelerometer Jerk signal Magnitude in time domain

**tBodyGyroMag.mean..** - Mean value of Body Gyroscope signal Magnitude in time domain

**tBodyGyroJerkMag.mean..** - Mean value of Body Gyroscope Jerk signal Magnitude in time domain

**fBodyAcc.mean…X** - Mean value of Body Accelerometer signal in frequency domain for X-axis

**fBodyAcc.mean…Y** - Mean value of Body Accelerometer signal in frequency domain for Y-axis

**fBodyAcc.mean…Z** - Mean value of Body Accelerometer signal in frequency domain for Z-axis

**fBodyAcc.meanFreq…X** - Weighted average of the frequency components to obtain a mean frequency value of Body Accelerometer signal in frequency domain for X-axis

**fBodyAcc.meanFreq…Y** - Weighted average of the frequency components to obtain a mean frequency value of Body Accelerometer signal in frequency domain for Y-axis

**fBodyAcc.meanFreq…Z** - Weighted average of the frequency components to obtain a mean frequency value of Body Accelerometer signal in frequency domain for Z-axis

**fBodyAccJerk.mean...X** - Mean value of Body Accelerometer Jerk signal in frequency domain for X-axis

**fBodyAccJerk.mean…Y** - Mean value of Body Accelerometer Jerk signal in frequency domain for Y-axis

**fBodyAccJerk.mean…Z** - Mean value of Body Accelerometer Jerk signal in frequency domain for Z-axis

**fBodyAccJerk.meanFreq…X** - Weighted average of the frequency components to obtain a mean frequency value of Body Accelerometer Jerk signal in frequency domain for X-axis

**fBodyAccJerk.meanFreq…Y** - Weighted average of the frequency components to obtain a mean frequency value of Body Accelerometer Jerk signal in frequency domain for Y-axis

**fBodyAccJerk.meanFreq…Z** - Weighted average of the frequency components to obtain a mean frequency value of Body Accelerometer Jerk signal in frequency domain for Z-axis

**fBodyGyro.mean…X** - Mean value of Body Gyroscope signal in frequency domain for X-axis

**fBodyGyro.mean…Y** - Mean value of Body Gyroscope signal in frequency domain for Y-axis

**fBodyGyro.mean…Z** - Mean value of Body Gyroscope signal in frequency domain for Z-axis

**fBodyGyro.meanFreq…X** - Weighted average of the frequency components to obtain a mean frequency value of Body Gyroscope signal in frequency domain for X-axis

**fBodyGyro.meanFreq…Y** - Weighted average of the frequency components to obtain a mean frequency value of Body Gyroscope signal in frequency domain for Y-axis

**fBodyGyro.meanFreq…Z** - Weighted average of the frequency components to obtain a mean frequency value of Body Gyroscope signal in frequency domain for Z-axis

**fBodyAccMag.mean..** - Mean value of Body Accelerometer signal’s Magnitude in frequency domain

**fBodyAccMag.meanFreq..** - Weighted average of the frequency components to obtain a mean frequency value of Body Accelerometer signal Magnitude in frequency domain

**fBodyBodyAccJerkMag.mean..** - Mean value of Body Accelerometer Jerk signal Magnitude in frequency domain

**fBodyBodyAccJerkMag.meanFreq..** - Weighted average of the frequency components to obtain a mean frequency value of Body Accelerometer Jerk signal Magnitude in frequency domain

**fBodyBodyGyroMag.mean..** - Mean value of Body Gyroscope signal Magnitude in frequency domain

**fBodyBodyGyroMag.meanFreq..** - Weighted average of the frequency components to obtain a mean frequency value of Body Gyroscope signal Magnitude in frequency domain

**fBodyBodyGyroJerkMag.mean..** - Mean value of Body Gyroscope Jerk signal Magnitude in frequency domain

**fBodyBodyGyroJerkMag.meanFreq..** - Weighted average of the frequency components to obtain a mean frequency value of Body Gyroscope Jerk signal Magnitude in frequency domain

**tBodyAcc.std…X** - Standard deviation value of Body Accelerometer signal in time domain for X-axis

**tBodyAcc.std…Y** - Standard deviation value of Body Accelerometer signal in time domain for Y-axis

**tBodyAcc.std…Z** - Standard deviation value of Body Accelerometer signal in time domain for Z-axis

**tGravityAcc.std…X** - Standard deviation value of Gravity Accelerometer signal in time domain for X-axis

**tGravityAcc.std…Y** - Standard deviation value of Gravity Accelerometer signal in time domain for Y-axis

**tGravityAcc.std…Z** - Standard deviation value of Gravity Accelerometer signal in time domain for Z-axis

**tBodyAccJerk.std…X** - Standard deviation value of Body Accelerometer Jerk signal in time domain for X-axis

**tBodyAccJerk.std…Y** - Standard deviation value of Body Accelerometer Jerk signal in time domain for Y-axis

**tBodyAccJerk.std…Z** - Standard deviation value of Body Accelerometer Jerk signal in time domain for Z-axis

**tBodyGyro.std…X** - Standard deviation value of Body Gyroscope signal in time domain for X-axis

**tBodyGyro.std…Y** - Standard deviation value of Body Gyroscope signal in time domain for Y-axis

**tBodyGyro.std…Z** - Standard deviation value of Body Gyroscope signal in time domain for Z-axis

**tBodyGyroJerk.std…X** - Standard deviation value of Body Gyroscope Jerk signal in time domain for X-axis

**tBodyGyroJerk.std…Y** - Standard deviation value of Body Gyroscope Jerk signal in time domain for Y-axis

**tBodyGyroJerk.std…Z** - Standard deviation value of Body Gyroscope Jerk signal in time domain for Z-axis

**tBodyAccMag.std..** - Standard deviation value of Body Accelerometer signal Magnitude in time domain

**tGravityAccMag.std..** - Standard deviation value of Gravity Accelerometer signal Magnitude in time domain

**tBodyAccJerkMag.std..** - Standard deviation value of Body Accelerometer Jerk signal Magnitude in time domain

**tBodyGyroMag.std..** - Standard deviation value of Body Gyroscope signal Magnitude in time domain

**tBodyGyroJerkMag.std..** - Standard deviation value of Body Gyroscope Jerk signal Magnitude in time domain

**fBodyAcc.std…X** - Standard deviation value of Body Accelerometer signal in frequency domain for X-axis

**fBodyAcc.std…Y** - Standard deviation value of Body Accelerometer signal in frequency domain for Y-axis

**fBodyAcc.std…Z** - Standard deviation value of Body Accelerometer signal in frequency domain for Z-axis

**fBodyAccJerk.std…X** - Standard deviation value of Body Accelerometer Jerk signal in frequency domain for X-axis

**fBodyAccJerk.std…Y** - Standard deviation value of Body Accelerometer Jerk signal in frequency domain for Y-axis

**fBodyAccJerk.std…Z** - Standard deviation value of Body Accelerometer Jerk signal in frequency domain for Z-axis

**fBodyGyro.std…X** - Standard deviation value of Body Gyroscope signal in frequency domain for X-axis

**fBodyGyro.std…Y** - Standard deviation value of Body Gyroscope signal in frequency domain for Y-axis

**fBodyGyro.std…Z** - Standard deviation value of Body Gyroscope signal in frequency domain for Z-axis

**fBodyAccMag.std..** - Standard deviation value of Body Accelerometer signal magnitude in frequency domain

**fBodyBodyAccJerkMag.std..** - Standard deviation value of Body Accelerometer Jerk signal magnitude in frequency domain

**fBodyBodyGyroMag.std..** - Standard deviation value of Body Gyroscope signal magnitude in frequency domain

**fBodyBodyGyroJerkMag.std..** - Standard deviation value of Body Gyroscope Jerk signal magnitude in frequency domain     


**Obs.:**

*1. The variables for both ds_tidy1 and ds_tidy2 are the same. The difference between the values on each of the DS’s is that in the first case, they represent each individual measurement performed. In the latter, they represent the mean of all measurements performed for each combination of volunteer Id and Activity.*

*2. The values are given in standard gravity units 'g'.*
