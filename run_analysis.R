library(reshape2)

activityLabels <- read.table("activity_labels.txt", header = FALSE, col.names = c("activity_id","activity_name"))
featureLabels <- read.table("features.txt", header = FALSE, col.names = c("feature_id","feature_name"))

subjectTest <- read.table("test/subject_test.txt", header = FALSE, col.names = c("subject_id"))
XTest <- read.table("test/X_test.txt", header = FALSE, col.names = featureLabels$feature_name)
YTest <- read.table("test/y_test.txt", header = FALSE, col.names = c("activity_id"))

subjectTrain <- read.table("train/subject_train.txt", header = FALSE, col.names = c("subject_id"))
XTrain <- read.table("train/X_train.txt", header = FALSE, col.names = featureLabels$feature_name)
YTrain <- read.table("train/y_train.txt", header = FALSE, col.names = c("activity_id"))

YTest <- merge(YTest,activityLabels)
YTrain <- merge(YTrain, activityLabels)

XTest <- XTest[,grep("mean|std", names(XTest))]
XTrain <- XTrain[,grep("mean|std", names(XTrain))]

cleanData <- rbind(cbind(subjectTest,YTest,XTest),cbind(subjectTrain,YTrain,XTrain))

meltedData <- melt(cleanData,id=c("subject_id","activity_name"))
means <- dcast(meltedData,subject_id + activity_name ~ variable, mean)


write.table(means,file="run_analysis.txt",row.name=FALSE)
