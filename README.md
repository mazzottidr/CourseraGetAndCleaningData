#Read Me file - Get and Cleaning Data Course Project

This file brifely describes the overall idea of the `run_analysis.R` script.

This script was develop to proccess smartphone motion data. Further information can be found in the following reference:


	Human Activity Recognition Using Smartphones Dataset
	Version 1.0
	Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
	Smartlab - Non Linear Complex Systems Laboratory
	DITEN - Università degli Studi di Genova.
	Via Opera Pia 11A, I-16145, Genoa, Italy.
	activityrecognition@smartlab.ws
	www.smartlab.ws

####The following text was extracted from `README.TXT` file from the dataset folder (download [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ))

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details."

###Description of `run_analysis.R`:

This script uses the recently launched `dplyr` package. Below, step by step description of the script:

- Load `dplyr`
- Load Test and Train data
- Load Subject Vector and activity labels
- Reshape test and train dataset with information about subject and activity, as well as origin of data (train or test)
- Merges the training and the test sets to create one data set
- Load and annotate columns names on the created dataframe
- Change activity labels to descriptive activity names
- Extracts only the measurements on the mean and standard deviation for each measurement, reshape variable names and write to a file (optional)
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject (only variables that contain means or std) and write it to a file.