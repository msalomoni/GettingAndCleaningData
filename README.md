#Introduction

This assignment uses data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project are available at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The goal of the assignment is to create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This repository contains:

* run_analysis.R - the scripts that downloads, analyzes, and create a tidy data set
* CodeBook.md - a code book that describes the variables, the data, and all the transformations performed to clean up the data
* run_analysis.txt - the tidy data set outcome of the cleaning procedures
* README.md - this file
