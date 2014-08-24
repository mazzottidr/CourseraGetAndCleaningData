#Get and cleaning data course project

#Install and load packages
#If needed, uncomment and install dplyr:

#install.packages("dplyr")

#load dplyr
library(dplyr)

#If needed, download and unzip data
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "course_project_data.zip")
#unzip("course_project_data.zip")

#Please run this script in the same directory as the folder UCI HAR Dataset

#Load Test and Train data
test <- read.table("UCI HAR Dataset//test/X_test.txt")
train <- read.table("UCI HAR Dataset//train//X_train.txt")

#Load Subject Vector and activity labels
subject_test <- read.table("UCI HAR Dataset//test//subject_test.txt")
subject_train <- read.table("UCI HAR Dataset//train//subject_train.txt")
act_labels_test <- read.table("UCI HAR Dataset//test/y_test.txt")
act_labels_train <- read.table("UCI HAR Dataset//train/y_train.txt")

#Include subjects in each dataset, as well as anotation of its origin (test or train)
#Append subject (col 1) and activity (col 2) info
test <- cbind(subject_test, act_labels_test, origin="test", test)
train <- cbind(subject_train, act_labels_train, origin="train", train)

#Merges the training and the test sets to create one data set
dataset <- rbind(test, train)

#Load columns names
features <- read.table("UCI HAR Dataset/features.txt", row.names=1)
#Anotate column names
colnames(dataset) <- c("subject", "activity", "origin", as.character(features[,1]))


#Change activity labels to descriptive activity names
#Load labels
act_labels <- read.table("UCI HAR Dataset//activity_labels.txt")
#Activity as factor (so levels can be changed)
dataset$activity <- as.factor(dataset$activity)
#Change levels to meaninful names
levels(dataset$activity) <- as.character(act_labels$V2)


#Extracts only the measurements on the mean and standard deviation for each measurement
#Get index of "mean" and "Mean" measurements
mean_indexes <- grep("mean",colnames(dataset))
mean_indexes <- c(mean_indexes, grep("Mean",colnames(dataset)))
#Get index of "std" measurements
std_indexes <- grep("std",colnames(dataset))
#Merge indexes
step2_index <- c(mean_indexes, std_indexes)

#Create dataset with only mean and std measurements, clean header (remove parenthesis) and write to file. Information about subject and activity was kept on the dataset on purpose.
#Subset dataset
dataset_step2 <- dataset[,c(1,2,step2_index)]
#Appropriately labels the data set with descriptive variable names. 
colnames(dataset_step2) <- sub("\\(\\)", "", colnames(dataset_step2))
#Write to file (optional, uncomment to do so)
#write.table(dataset_step2, file="mean_std_measurements.txt", row.names=F)

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject (only variables that contain means or std). 
tidy_data <- dataset_step2 %>% group_by(activity, subject) %>% summarise_each(funs(mean))

#Write tidy dataset to file
write.table(tidy_data, file="tidy_dataset.txt", row.names=F)
