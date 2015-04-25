X_test<-read.table("UCI HAR Dataset\\test\\X_test.txt", sep="")
y_test<-read.table("UCI HAR Dataset\\test\\y_test.txt", sep="")
X_train<-read.table("UCI HAR Dataset\\train\\X_train.txt", sep="")
y_train<-read.table("UCI HAR Dataset\\train\\y_train.txt", sep="")
subject_test<-read.table("UCI HAR Dataset\\test\\subject_test.txt", sep="")
subject_train<-read.table("UCI HAR Dataset\\train\\subject_train.txt", sep="")
features<-read.table("UCI HAR Dataset\\features.txt", sep="")
act_lbl<-read.table("UCI HAR Dataset\\activity_labels.txt",sep="")
#Reading all the required files

fulldataset<-rbind(X_train,X_test)
#appending training and test data sets
colnames(fulldataset)<-c(as.character(features[[2]]))
#changing the column names based on features file

#grx <- glob2rx("*mean\\|*std\\")
grx<- grep("-(mean|std)\\(\\)", features[, 2])
Desireddata<-fulldataset[,grx]
#get all columns with the identifier as mean and standard deviation

y<-rbind(y_train,y_test)
subject<-rbind(subject_train,subject_test)
#appending the activity and subject of train and test 

Desireddata[,"y"]<-y
Desireddata[,"subject"]<-subject
#column bind the activity and subject with the desired data set

colnames(act_lbl)<-c('y','activity')
#renaming activity label as y and activity so that join becomes easy
mergedata<-merge(Desireddata,act_lbl)
#joining process to get proper description of the activity

mergedata$y=NULL
#removing the y column since we have the activity description

mergedata$subject<-as.factor(mergedata$subject)
#changing the subject as a factor so as to make aggregation possible
tidydataset<-aggregate(mergedata[,1:66], by=list(activity=mergedata$activity,subject=mergedata$subject), mean, rm.na=TRUE)
#aggregation based on subject and activity hence the final step is the required output
write.table(tidydataset, "tidy_data.txt", row.name=FALSE)