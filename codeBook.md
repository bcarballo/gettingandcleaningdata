#CodeBook 
##Getting and Cleaning Data's Project

The script run_analysis.R cleans up the data in the folder UCI HAR Dataset. The data was collected from the accelerometers from the Samsung Galaxy S smartphone. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The analysis has the following steps:

* Loads test data: X_test= 2947 observations with 561 variables, subject_test=2947 observations, y_test=2947 observations (activities)
* Creates test.data.set binding this 3 data sets
* Loads train data: X_train=7352 observations with 561 variable, subject_test=7352 observations, y_test=7352 observations (activities)
* Creates train.data.set binding this 3 data sets
* Loads features dataset: 561 observations with 2 variables
* Merges train and test datasets
* Names the columns: 1st column=subject, 2nd to 562nd=features and 563rd=activity
* Creates a tidy.data.set with subject,activity and the columns that have the mean and the standard deviation information
* Labels the activity: 1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
* Creates a new tidy data set with the average of each variable for each activity and each subject
* Saves the tidy data in tidyData.txt (180 observations with 81 variables)




