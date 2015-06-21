#You should create one R script called run_analysis.R that does the following. 
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# loading library reshape2, in order to use melt later
library(reshape2)

# imports activity and feature tables
activityLabels <- read.table("activity_labels.txt", header = FALSE, col.names = c("activity_id","activity_name"))
featureLabels <- read.table("features.txt", header = FALSE, col.names = c("feature_id","feature_name"))

# creates the Test Dataset
subjectTest <- read.table("test/subject_test.txt", header = FALSE, col.names = c("subject_id"))
XTest <- read.table("test/X_test.txt", header = FALSE, col.names = featureLabels$feature_name)
YTest <- read.table("test/y_test.txt", header = FALSE, col.names = c("activity_id"))

# creates the Train Dataset
subjectTrain <- read.table("train/subject_train.txt", header = FALSE, col.names = c("subject_id"))
XTrain <- read.table("train/X_train.txt", header = FALSE, col.names = featureLabels$feature_name)
YTrain <- read.table("train/y_train.txt", header = FALSE, col.names = c("activity_id"))

# merges the Test and Train datasets with the activity labels, to have it readable
YTest <- merge(YTest,activityLabels)
YTrain <- merge(YTrain, activityLabels)

# cleans the Test and Train datasets leaving only the mean and standard deviation measurements
XTest <- XTest[,grep("mean|std", names(XTest))]
XTrain <- XTrain[,grep("mean|std", names(XTrain))]

# creates a unique dataset from the Test and Train ones
cleanData <- rbind(cbind(subjectTest,YTest,XTest),cbind(subjectTrain,YTrain,XTrain))

# refines the table and creates the second dataset with the avg of the activities
meltedData <- melt(cleanData,id=c("subject_id","activity_name"))
means <- dcast(meltedData,subject_id + activity_name ~ variable, mean)

# writes the output
write.table(means,file="run_analysis.txt",row.name=FALSE)
