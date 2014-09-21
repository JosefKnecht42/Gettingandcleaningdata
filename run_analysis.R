
library(dplyr)
library(stringr)
#load Feature.txt
features <- tbl_df(read.table("UCI HAR Dataset/features.txt",header=FALSE))
#beatyfing features
colnames(features) <- c("colindex","names")
features$names <- str_replace(features$names,"\\(\\)","")
features$names <- str_replace_all(features$names,"-","")
#selecting
featureIndex <- c(which(apply(features, 1, function(x) any(grepl("std", x)))),
which(apply(features, 1, function(x) any(grepl("mean", x)))) )
features_selected <- features[featureIndex,]
#reading activity labels
act_labels <- tbl_df(read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE))
colnames(act_labels) <- c("id","name")
## reading testdata
testdata <- tbl_df(read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE))
test_act <- tbl_df(read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE))
testdata<-cbind(testdata,test_act)
traindata <- tbl_df(read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE))
train_act <- tbl_df(read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE))
traindata<-cbind(traindata,train_act)
data <- tbl_df(rbind(testdata,traindata))

#Selecting columns
data_sel <- data[,c(features_selected$colindex,563)]
names(data_sel)<-c(as.vector(features_selected$names),"activity")

#Grouping
datafinal <- group_by(data_sel,activity)
datafinal <-summarise_each(datafinal,funs(mean))
datafinal$activity <- act_labels$name
#Writing
write.table(datafinal,file="output.txt", row.name=FALSE)
datafinal

