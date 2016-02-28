#1. Read the data
DFAct<-read.table("./activity_labels.txt", header=FALSE, stringsAsFactors=TRUE)
names(DFAct)<-c("code","activity")

Features<-read.table("./features.txt", header=FALSE, stringsAsFactors=TRUE)
names(Features)<-c("position","feature")

DFSubj<-read.table("./test/subject_test.txt", header=FALSE)
names(DFSubj)<-c("subject")

DFY<-read.table("./test/y_test.txt", header=FALSE)
names(DFY)<-c("activity")

DFX<-read.table("./test/X_test.txt", header=FALSE)
names(DFX)<-Features$feature

DFSubjTrain<-read.table("./train/subject_train.txt", header=FALSE)
names(DFSubjTrain)<-c("subject")

DFYTrain<-read.table("./train/y_train.txt", header=FALSE)
names(DFYTrain)<-c("activity")

DFXTrain<-read.table("./train/X_train.txt", header=FALSE)
names(DFXTrain)<-Features$feature

#2. Create resulting data set

#2.1 Merge test and train data sets
#Postpone to the moment, when test and train data sets will be reduced
#to the required columns (only measurements on the mean and standard deviation of each measurement)
#Smaller datasets - faster merge ("early projection", as in SQL query optimization)

#2.2 Extract only measurements on the mean and standard deviation 
#for each measurement

#2.2.1 Collect mean and standard deviation related feature labels

RelevantFeaturesMean<-grep("*mean*", Features$feature, ignore.case = TRUE, value = TRUE)
RelevantFeaturesStd<-grep("*std*", Features$feature, ignore.case = TRUE, value = TRUE)
IrrelevantFeaturesAngle<-grep("*angle*", Features$feature, ignore.case = TRUE, value = TRUE)

#remove angle-related values as irrelevant, 
#because angles between a mean vector and a given vector is not a mean angle
features<-setdiff(RelevantFeaturesMean,IrrelevantFeaturesAngle)

#union relevant *mean labels and *std labels of features
features<-union(features,RelevantFeaturesStd)

#2.2.2 
#Select only proper features (=column names) in DFX and DFXTrain

DFX<-DFX[,features]
DFXTrain<-DFXTrain[,features]

#3. Use descriptive activity names to name the activities in the data set

DFActY<-merge(DFAct, DFY, by.x="code", by.y="activity", all=TRUE)
DFActY<-DFActY$activity 
#DFActY is now factor, so transform it to data.frame
DFActY<-data.frame(DFActY)
names(DFActY)<-c("activity")

DFActYTrain<-merge(DFAct, DFYTrain, by.x="code", by.y="activity", all=TRUE)
DFActYTrain<-DFActYTrain$activity
#DFActYTrain is now factor, so transform it to data.frame
DFActYTrain<-data.frame(DFActYTrain)
names(DFActYTrain)<-c("activity")

#DFActY and DFActYTrain contain descriptive activity names instead of activity codes 1..6
#DFActY and DFActYTrain are ready to be "cbinded" with DFX and DFXTrain

#4. Construct a data set that will be used to produce a tidy data set
#(=one of the results of the course project).
#4.1 postponed from #2.1
#rbind training and test data sets
DFSubj<-rbind(DFSubj, DFSubjTrain)
DFActY<-rbind(DFActY, DFActYTrain)
DFX<-rbind(DFX, DFXTrain)

#dim(DFX);dim(DFActY);dim(DFSubj)

#4.2 cbind DFX, DFActY and DFSubj together

PreTidyDF<-cbind(DFSubj, DFActY, DFX)
#dim(PreTidyDF)
#names(PreTidyDF)

#5. From the data set in step 4, create a second independent tidy data set 
#with the average of each variable for each activity and each subject

#Each subject (of 30 volunteers) performs one of 6 possible activities many times.
#This tidy data set will be averaging the peculiarities of activity performance 
#by each of volunteers. Some volunteers perform several activities, some - only one activity.

library(reshape2)
molten<-melt(PreTidyDF, id=c("subject", "activity"), measured=features)
casted<-dcast(molten, subject + activity ~ ..., mean)
#dim(casted)
#set standard scientific view to avoid long sequences of numbers 0..9
casted<-format(casted, scientific=TRUE)
write.table(casted, file = "./tidydataset.txt", append = FALSE, quote = FALSE, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE)
