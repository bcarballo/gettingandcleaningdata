#Getting and Cleaning Data
##Peer Assessment

###1. Merges the training and the test sets to create one data set.
  ###Loading test data
  X_test<-read.table("X_test.txt",sep="")
  y_test<-read.table("y_test.txt",sep="")
  subject_test<-read.table("subject_test.txt",sep="")
  test.data.set<-cbind(subject_test,X_test,y_test)

  ###Loading train data
  X_train<-read.table("X_train.txt",sep="")
  y_train<-read.table("y_train.txt",sep="")
  subject_train<-read.table("subject_train.txt",sep="")
  train.data.set<-cbind(subject_train,X_train,y_train)
  
  ###Loading features data
  features<-read.table("features.txt",sep="",stringsAsFactor=FALSE)
  
  ###Merging train and test datasets
  data.set<-rbind(test.data.set,train.data.set)
  
  ###Naming data.set columns
  names(data.set)[2:562]<-features[,2]
  names(data.set)[1]<-"subject"
  names(data.set)[563]<-"activity"
  
###2.Extracts only the measurements on the mean and standard deviation for each measurement. 
  ###Getting mean and standard deviation
  tidy.data.set<-data.set[grepl("mean\\(\\)|std\\(\\)|meanFreq", colnames(data.set)) ]
  
  ###Adding subject and activity columns
  tidy.data.set<-cbind(data.set[,1],data.set[,563],tidy.data.set)
  
  ###Naming subject and activity columns
  names(tidy.data.set)[1]<-"subject"
  names(tidy.data.set)[2]<-"activity"
  
###3.Uses descriptive activity names to name the activities in the data set
###4.Appropriately labels the data set with descriptive activity names. 
  ###Loading activity label file
  act_labels<-read.table("activity_labels.txt",sep="",stringsAsFactor=FALSE)
  
  ###Labeling activity column
  tidy.data.set$activity <- factor(tidy.data.set$activity,
                                   levels = act_labels$V1,
                                   labels = act_labels$V2)

###5.Creates a second, independent tidy data set with the average of each variable for 
  ###each activity and each subject. 
  ###Loading reshape2 library
  library(reshape2)
  
  ###Reshaping final tidy dataset
  tidy.melt<-melt(tidy.data.set,id=c("subject","activity"),measure.vars=names(tidy.data.set[,3:ncol(tidy.data.set)]))
  final.tidy.data<-dcast(tidy.melt,subject+activity~variable,mean)
  
  
###6.Saves tidy dataset in a file
  write.table(final.tidy.data,file="tidyData.txt",sep=" ",col.names=TRUE,row.names=FALSE)