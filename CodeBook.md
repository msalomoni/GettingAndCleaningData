# Description of data
A full description of raw data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Raw data transformation produces a tidy data set that includes both the training and test data sets. Feature names with the format "mean.X" are the avg of the feature X grouped by "Activity" and "Subject". the tidy data set contains the following features:

"subject_id" "activity_name" "activity_id" "tBodyAcc.mean...X" "tBodyAcc.mean...Y" "tBodyAcc.mean...Z" "tBodyAcc.std...X" "tBodyAcc.std...Y" "tBodyAcc.std...Z" "tGravityAcc.mean...X" "tGravityAcc.mean...Y" "tGravityAcc.mean...Z" "tGravityAcc.std...X" "tGravityAcc.std...Y" "tGravityAcc.std...Z" "tBodyAccJerk.mean...X" "tBodyAccJerk.mean...Y" "tBodyAccJerk.mean...Z" "tBodyAccJerk.std...X" "tBodyAccJerk.std...Y" "tBodyAccJerk.std...Z" "tBodyGyro.mean...X" "tBodyGyro.mean...Y" "tBodyGyro.mean...Z" "tBodyGyro.std...X" "tBodyGyro.std...Y" "tBodyGyro.std...Z" "tBodyGyroJerk.mean...X" "tBodyGyroJerk.mean...Y" "tBodyGyroJerk.mean...Z" "tBodyGyroJerk.std...X" "tBodyGyroJerk.std...Y" "tBodyGyroJerk.std...Z" "tBodyAccMag.mean.." "tBodyAccMag.std.." "tGravityAccMag.mean.." "tGravityAccMag.std.." "tBodyAccJerkMag.mean.." "tBodyAccJerkMag.std.." "tBodyGyroMag.mean.." "tBodyGyroMag.std.." "tBodyGyroJerkMag.mean.." "tBodyGyroJerkMag.std.." "fBodyAcc.mean...X" "fBodyAcc.mean...Y" "fBodyAcc.mean...Z" "fBodyAcc.std...X" "fBodyAcc.std...Y" "fBodyAcc.std...Z" "fBodyAcc.meanFreq...X" "fBodyAcc.meanFreq...Y" "fBodyAcc.meanFreq...Z" "fBodyAccJerk.mean...X" "fBodyAccJerk.mean...Y" "fBodyAccJerk.mean...Z" "fBodyAccJerk.std...X" "fBodyAccJerk.std...Y" "fBodyAccJerk.std...Z" "fBodyAccJerk.meanFreq...X" "fBodyAccJerk.meanFreq...Y" "fBodyAccJerk.meanFreq...Z" "fBodyGyro.mean...X" "fBodyGyro.mean...Y" "fBodyGyro.mean...Z" "fBodyGyro.std...X" "fBodyGyro.std...Y" "fBodyGyro.std...Z" "fBodyGyro.meanFreq...X" "fBodyGyro.meanFreq...Y" "fBodyGyro.meanFreq...Z" "fBodyAccMag.mean.." "fBodyAccMag.std.." "fBodyAccMag.meanFreq.." "fBodyBodyAccJerkMag.mean.." "fBodyBodyAccJerkMag.std.." "fBodyBodyAccJerkMag.meanFreq.." "fBodyBodyGyroMag.mean.." "fBodyBodyGyroMag.std.." "fBodyBodyGyroMag.meanFreq.." "fBodyBodyGyroJerkMag.mean.." "fBodyBodyGyroJerkMag.std.." "fBodyBodyGyroJerkMag.meanFreq.."

#Transformations on raw data
Part 1: Merge the training and the test sets to create one data set.
* Training/Test measurements are read into different variables.
* Merging (making a union) of both sets using rbind.

Part 2: Extracts only the measurements on the mean and standard deviation for each measurement.
* Features indices are read into a matrix[idx,featureName]
* Features are filtered using grep containing "mean" or "std"
* DataSet columns are filtered by indices returned in second step.
* Training/Test activities are read into different variables.
* Merging (making a union) of both sets using rbind.
* Training/Test subjects are read into different variables.
* Merging (making a union) of both sets using rbind.
* Merging measurements,activities,subjects using cbind.

Part 3: Uses descriptive activity names to name the activities in the data set
* Activity column is converted into factor.
* Activity factor is renamed with descriptive activity names.
* Activity column is assigned the descriptive factors.

Part 4: Appropriately labels the data set with descriptive activity names. Assumption: Descriptive names = descriptive column names. Column names also set in Part 2

Part 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Data set created above is transformed into a data table.
* Columns are averaged grouping by "Activity" and "subject"
* Tidy set is written to a file.
