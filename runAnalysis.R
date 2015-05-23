
##Requirements

#1. Merging training and test datasets to one data set  
#2. Extracting only the measurements on the mean and standard deviation for each measurement  
#3. Using descriptive activity names to name the activities in the dataset  
#4. Appropriately labeling the dataset with descriptive variable names  
#5. Creates a second dataset, independent of tidy data set with average of each variable for each activity and each subject  

# Assumes the working directory to be "UCI HAR Dataset"

##Loading data
allFeatures <- read.table("features.txt")

names(allFeatures) <- c("featureId","featureName")

activities <- read.table("activity_labels.txt")

names(activities) <- c("activityId","activityName")

trainingX <- read.table("train/X_train.txt")

trainingY <- read.table("train/y_train.txt")

names(trainingY) <- c("activityId")

trainingSubject <- read.table("train/subject_train.txt")

names(trainingSubject) <- c("subjectId")

testX <- read.table("test/X_test.txt")

testY <- read.table("test/y_test.txt")

names(testY) <- c("activityId")

##4.Appropriately labeling the dataset with descriptive variable names  

names(trainingX) <- allFeatures$featureName

names(testX) <- allFeatures$featureName

testSubject <- read.table("test/subject_test.txt")

names(testSubject) <- c("subjectId")

##1.Merging training and test datasets to one data set 
dataX <- rbind(trainingX,testX)

dataY <- rbind(trainingY,testY)

dataSubject <- rbind(trainingSubject,testSubject)

##2.Extracting only the measurements on the mean and standard deviation for each measurement  
meanStdFeatures <- grep("std|mean",allFeatures$featureName)

dataTableX <- dataX[,meanStdFeatures]

dataTableXYS <- cbind(dataSubject,dataTableX,dataY)

#3.Using descriptive activity names to name the activities in the dataset  
tidyDataSet <- merge(activities,dataTableXYS,by="activityId")

head(tidyDataSet)

##5.Creates a second dataset, independent of tidy data set with average of each variable for each activity and each subject

aggrData <- aggregate(tidyDataSet[,3:ncol(tidyDataSet)], list(tidyDataSet$subjectId,tidyDataSet$activityId,tidyDataSet$activityName),mean)

names(aggrData) <- c("sub","activityId","activityName",names(aggrData)[4:length(aggrData)])

aggregatedData <- aggrData[,2:ncol(aggrData)]

head(aggregatedData)

write.table(tidyDataSet,"tidy.txt",row.names=FALSE)
write.table(aggregatedData,"meanTidyDataset.txt",row.names=FALSE)