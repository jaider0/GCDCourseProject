# README file for script “run_analysis.R”

This README file explains each step used in the R script “run_analysis.R” to process raw data into 2 tidy datasets: ds_tidy1 and ds_tidy2.

The raw data used for this analysis was obtained from the UCI Machine Learning Repository on an experiment that collected movement data from the sensor signals (accelerometer and gyroscope) of a Samsung Galaxy S II device used in a group of 30 volunteers.
The input raw data files for the script can be downloaded using the following link: 
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For further details regarding information on raw data files and how they were collected, please refer to the following link:
* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

In order to assure that the script works properly, it is mandatory that you download and unzip the SAMSUNG raw data files, which should be kept in your R main directory in the exact same file structure as received.


## Analysis Steps

The following describes the steps executed in the R script to obtain both tidy datasets:

1. Load “plyr” and “dplyer” packages, required for this data manipulation

2. Check if the following raw data files required for this analyses exists in their respective directories:

  * UCI HAR Dataset/train/X_train.txt
  * UCI HAR Dataset/train/subject_train.txt
  * UCI HAR Dataset/train/y_train.txt
  * UCI HAR Dataset/test/X_test.txt
  * UCI HAR Dataset/test/subject_test.txt
  * UCI HAR Dataset/test/y_test.txt
  * UCI HAR Dataset/features.txt
  * UCI HAR Dataset/activity_labels.txt

3. Function read.table() was used to read the data into R objects, directly assigning the respective variable labels for each column

  3.1 Until this point, no data manipulation has been performed and raw data is loaded into R objects as-is.

  3.2 Variable labels for the measured movement data, were assigned according to their original description, recorded in the file “features.txt”.


4. The first data manipulation is performed in this step, where all raw datasets are merged into 1 complete data set in the following order:

  4.1 Using join() function, the activity’s description (detailed in file activity_labels.txt) is added to the activity data set (files “y_train.txt” and y_test.txt) and stored in objects “act_train_descriptive” and “act_test_descriptive”.

  4.2 Columns including: volunteer’s id, activity code and description, and the activity measurements are binded using cbind() function and stored in objects “ds_train_complete” and “ds_test_complete”(for train and test measurments respectively).

  4.3 Finally the test and training measurements are gathered into 1 dataset called “ds_complete”, using rbind() function.

  4.4 At this point we have one complete dataset (ds_complete), with all measurements from the test and the train groups.


5. The second data manipulation, gives birth to our first tidy dataset, called ds_tidy1. In this step, the only measurement columns maintained from the “ds_complete” dataset are those that measure means and standard deviations. All other columns (except 1 to 3 - id, activity id and description) are removed.

  5.1 The criteria used for determining the measurement columns that are maintained was those who included “mean” and “std” in it’s description. Function grep() for that manner.

  5.2 ds_tidy1 is sorted by SubjectId and ActivityCode


6. The second and last tidy dataset called “ds_tidy2”, uses ddply() function to  calculate the means of each column in “ds-tidy1”, for each combination of SubjectId and ActivityCode/ActivityName.

7. Output of “ds_tidy2” to a txt file called “tidy2.txt”, saved in the main R directory.


## Conclusion

By the end of the script, although only the ds_tidy2 will be outputted as a txt file, all raw, intermediate and final datasets used in this process will be available including the following R objects:
* **ds_train:**		original raw measurements data for the training group
* **ds_test:**		original raw measurements data for the test group
* **act_train:**		original raw data for activities performed in each measurement of the train group
* **act_test:**		original raw data for activities performed in each measurement of the test group
* **id_train:**		original raw data for the volunteer id performing each measurement of the train group
* **id_test:**		original raw data for the volunteer id performing each measurement of the test group
* **ds_train_complete:**	manipulated dataset containing volunteer id, activity code, activity description and all measurements of the train group
* **ds_test_complete:**	manipulated dataset containing volunteer id, activity code, activity description and all measurements of the test group
* **ds_complete:**		manipulated dataset containing volunteer id, activity code, activity description and all measurements of all groups
* **ds_tidy1:**		tidy dataset containing volunteer id, activity code, activity description and measurements on mean and standard deviation of all groups
* **ds_tidy2:**		the output file of tidy dataset containing volunteer id, activity code, activity description and the mean of all measurements of ds_tidy1 for each combination of volunteer id and activity