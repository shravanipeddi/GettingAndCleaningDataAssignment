#Description  

The following are achieved by runAnalysis.R  
  
1. Merging training and test datasets to one data set  
2. Extracting only the measurements on the mean and standard deviation for each measurement  
3. Using descriptive activity names to name the activities in the dataset  
4. Appropriately labeling the dataset with descriptive variable names  
5. Creates a second dataset, independent of tidy data set with average of each variable for each activity and each subject  


#Describing Variables & Flow of runAnalysis.R  
allFeatures : Holds all the feature names with its id  
activities : Holds all the names of activities with id  
  
trainingX : Holds training data of X - contains readings for each feature  
trainingY : Holds training data of Y - contains corresponding activity id for the reads of trainingX  
trainingSubject : Holds corresponding subject code for each of readings in trainingX data and activity id in trainingY  
  
testX, testY, testSubject are analogous to trainingX, trainingY and trainingSubject but are usually considered for testing purposes.  
  
dataX : combines training and test sets of X row wise  
dataY : combines training and test sets of Y row wise  
dataSubject : combines training and test sets of subjects  
  
meanStdFeatures : get column numbers which consist of mean and std in their column name  
  
dataTableX : filter data by the column numbers obtained in meanStdFeatures  
  
dataTableXYS : Combine features filtered data, subject data & activity id data to make it a complete meaningful data set  
  
tidyDataSet : merge the dataTableXYS with activities data set to get the names of activities attatched to the existing meaningful data set  
  
aggrData : aggregated tidyDataSet by taking means for each variable filtered by subject and activity  
  
aggregatedData : removing unwanted columns in aggrData, formatted for tidy show up  
  

