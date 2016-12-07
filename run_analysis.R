## Downloading
getwd()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
unzip("getdata-projectfiles-UCI_HAR_Dataset.zip", exdir="UCIDataset")
list.files("UCIDataset")
list.files("UCIDataset/test")
list.files("UCIDataset/train")
#
# Reading in Test Data
library(data.table)
library(plyr)
library(dplyr)
data.subtest <- fread("./UCIDataset/test/subject_test.txt",
                      sep=" ", na.strings = c("NA", "N/A", "null", "?"))
Test.subject <- rename(data.subtest, subject.no =V1)
dim(Test.subject)
table(Test.subject)
##
data.xtest <- fread("./UCIDataset/test/X_test.txt",
                    sep=" ", na.strings = c("NA", "N/A", "null", "?"))
dim(data.xtest)
#
data.ytest <- fread("./UCIDataset/test/y_test.txt",
                    sep=" ", na.strings = c("NA", "N/A", "null", "?"))
Test.activity <- rename(data.ytest, activity =V1)
dim(Test.activity)
table(Test.activity)
##
## For Test Data: Extracting the mean & standard deviation for each measurement
Time.test.Data <- select(data.xtest, V1:V6, V41:V46, V81:V86, V121:126, V161:V166, 
                         V201, V202, V214, V215, V227, V228, V240, V241, V253, V254,
                         V266:V271, V345:V350, V424:V429,
                         V503, V504, V516, V517, V529, V530, V542, V543)
testData <- as.data.frame(cbind(Test.subject, Test.activity, Time.test.Data))
dim(testData)
names(testData)
# Labeling the test data set with descriptive variable names
Total.testData <- rename(testData, 
                         tBodyAcc.Xmean= V1, tBodyAcc.Ymean = V2, tBodyAcc.Zmean = V3, 
                         tBodyAcc.Xstd = V4, tBodyAcc.Ystd = V5, tBodyAcc.Zstd = V6,
                         tGravityAcc.Xmean= V41, tGravityAcc.Ymean= V42, tGravityAcc.Zmean= V43,
                         tGravityAcc.Xstd= V44, tGravityAcc.Ystd= V45, tGravityAcc.Zstd= V46,
                         tBodyAccJerk.Xmean=V81, tBodyAccJerk.Ymean=V82, tBodyAccJerk.Zmean=V83,
                         tBodyAccJerk.Xstd=V84, tBodyAccJerk.Ystd=V85, tBodyAccJerk.Zstd=V86,
                         tBodyGyro.Xmean= V121, tBodyGyro.Ymean= V122, tBodyGyro.Zmean= V123,
                         tBodyGyro.Xstd= V124, tBodyGyro.Ystd= V125, tBodyGyro.Zstd= V126,
                         tBodyGyroJerk.Xmean= V161, tBodyGyroJerk.Ymean= V162, tBodyGyroJerk.Zmean= V163,
                         tBodyGyroJerk.Xstd= V164, tBodyGyroJerk.Ystd= V165, tBodyGyroJerk.Zstd= V166,
                         tBodyAccMag.mean= V201, tBodyAccMag.std= V202, 
                         tGravityAccMag.mean= V214, tGravityAccMag.std= V215,
                         tBodyAccJerkMag.mean= V227, tBodyAccJerkMag.std= V228,
                         tBodyGyroMag.mean= V240, tBodyGyroMag.std= V241,
                         tBodyGyroJerkMag.mean= V253, tBodyGyroJerkMag.std= V254,
                         fBodyAcc.Xmean= V266, fBodyAcc.Ymean = V267, fBodyAcc.Zmean = V268, 
                         fBodyAcc.Xstd = V269, fBodyAcc.Ystd = V270, fBodyAcc.Zstd = V271,
                         fBodyAccJerk.Xmean=V345, fBodyAccJerk.Ymean=V346, fBodyAccJerk.Zmean=V347,
                         fBodyAccJerk.Xstd=V348, fBodyAccJerk.Ystd=V349, fBodyAccJerk.Zstd=V350,
                         fBodyGyro.Xmean= V424, fBodyGyro.Ymean= V425, fBodyGyro.Zmean= V426,
                         fBodyGyro.Xstd= V427, fBodyGyro.Ystd= V428, fBodyGyro.Zstd= V429,
                         fBodyAccMag.mean= V503, fBodyAccMag.std= V504, 
                         fBodyAccJerkMag.mean= V516, fBodyAccJerkMag.std= V517,
                         fBodyGyroMag.mean= V529, fBodyGyroMag.std= V530,
                         fBodyGyroJerkMag.mean= V542, fBodyGyroJerkMag.std= V543)
dim(Total.testData)
names(Total.testData)
# Using descriptive activity labels to name the activities
Total.testData$activity <- gsub("1","walking", Total.testData$activity)     
Total.testData$activity <- gsub("2","walking up", Total.testData$activity)
Total.testData$activity <- gsub("3","walking down", Total.testData$activity)
Total.testData$activity <- gsub("4","sitting", Total.testData$activity)
Total.testData$activity <- gsub("5","standing", Total.testData$activity)
Total.testData$activity <- gsub("6","laying", Total.testData$activity)  
head(Total.testData)
Total.testData[1:3,]
#
# Reading in the Training Data
data.subtrain <- fread("./UCIDataset/train/subject_train.txt",
                       sep=" ", na.strings = c("NA", "N/A", "null", "?"))
Train.subject <- rename(data.subtrain, subject.no =V1)
dim(Train.subject)
table(Train.subject)       
#
# For Training Data
data.xtrain <- fread("./UCIDataset/train/X_train.txt",
                     sep=" ", na.strings = c("NA", "N/A", "null", "?"))
dim(data.xtrain)
#
data.ytrain <- fread("./UCIDataset/train/y_train.txt",
                     sep=" ", na.strings = c("NA", "N/A", "null", "?"))
Train.activity <- rename(data.ytrain, activity =V1)
dim(Train.activity)
table(Train.activity)    
# For Training Data: Extracting the mean & standard deviation for each measurement
Time.train.Data <- select(data.xtrain, V1:V6, V41:V46, V81:V86, V121:126, V161:V166, 
                          V201, V202, V214, V215, V227, V228, V240, V241, V253, V254,
                          V266:V271, V345:V350, V424:V429,
                          V503, V504, V516, V517, V529, V530, V542, V543)
trainData <- as.data.frame(cbind(Train.subject, Train.activity, Time.train.Data))
dim(trainData)
names(trainData)
# Labeling the train data set with descriptive variable names
Total.trainData <- rename(trainData, 
                          tBodyAcc.Xmean= V1, tBodyAcc.Ymean = V2, tBodyAcc.Zmean = V3, 
                          tBodyAcc.Xstd = V4, tBodyAcc.Ystd = V5, tBodyAcc.Zstd = V6,
                          tGravityAcc.Xmean= V41, tGravityAcc.Ymean= V42, tGravityAcc.Zmean= V43,
                          tGravityAcc.Xstd= V44, tGravityAcc.Ystd= V45, tGravityAcc.Zstd= V46,
                          tBodyAccJerk.Xmean=V81, tBodyAccJerk.Ymean=V82, tBodyAccJerk.Zmean=V83,
                          tBodyAccJerk.Xstd=V84, tBodyAccJerk.Ystd=V85, tBodyAccJerk.Zstd=V86,
                          tBodyGyro.Xmean= V121, tBodyGyro.Ymean= V122, tBodyGyro.Zmean= V123,
                          tBodyGyro.Xstd= V124, tBodyGyro.Ystd= V125, tBodyGyro.Zstd= V126,
                          tBodyGyroJerk.Xmean= V161, tBodyGyroJerk.Ymean= V162, tBodyGyroJerk.Zmean= V163,
                          tBodyGyroJerk.Xstd= V164, tBodyGyroJerk.Ystd= V165, tBodyGyroJerk.Zstd= V166,
                          tBodyAccMag.mean= V201, tBodyAccMag.std= V202, 
                          tGravityAccMag.mean= V214, tGravityAccMag.std= V215,
                          tBodyAccJerkMag.mean= V227, tBodyAccJerkMag.std= V228,
                          tBodyGyroMag.mean= V240, tBodyGyroMag.std= V241,
                          tBodyGyroJerkMag.mean= V253, tBodyGyroJerkMag.std= V254,
                          fBodyAcc.Xmean= V266, fBodyAcc.Ymean = V267, fBodyAcc.Zmean = V268, 
                          fBodyAcc.Xstd = V269, fBodyAcc.Ystd = V270, fBodyAcc.Zstd = V271,
                          fBodyAccJerk.Xmean=V345, fBodyAccJerk.Ymean=V346, fBodyAccJerk.Zmean=V347,
                          fBodyAccJerk.Xstd=V348, fBodyAccJerk.Ystd=V349, fBodyAccJerk.Zstd=V350,
                          fBodyGyro.Xmean= V424, fBodyGyro.Ymean= V425, fBodyGyro.Zmean= V426,
                          fBodyGyro.Xstd= V427, fBodyGyro.Ystd= V428, fBodyGyro.Zstd= V429,
                          fBodyAccMag.mean= V503, fBodyAccMag.std= V504, 
                          fBodyAccJerkMag.mean= V516, fBodyAccJerkMag.std= V517,
                          fBodyGyroMag.mean= V529, fBodyGyroMag.std= V530,
                          fBodyGyroJerkMag.mean= V542, fBodyGyroJerkMag.std= V543)
dim(Total.trainData)
names(Total.trainData)
# Using descriptive activity labels to name the activities
Total.trainData$activity <- gsub("1","walking", Total.trainData$activity)     
Total.trainData$activity <- gsub("2","walking up", Total.trainData$activity)
Total.trainData$activity <- gsub("3","walking down", Total.trainData$activity)
Total.trainData$activity <- gsub("4","sitting", Total.trainData$activity)
Total.trainData$activity <- gsub("5","standing", Total.trainData$activity)
Total.trainData$activity <- gsub("6","laying", Total.trainData$activity)  
Total.trainData[330:350,]
#
mergedData <- merge(Total.testData, Total.trainData, all=TRUE)
dim(mergedData)
names(mergedData)
# Checking the Merged Dataframe
head(mergedData, 2)
mergedData[330:350,]
mergedData[640:660,]
#
# Working with the Merged Data
Z <- c("tBodyAcc.Xmean","tBodyAcc.Ymean","tBodyAcc.Zmean","tBodyAcc.Xstd",        
       "tBodyAcc.Ystd","tBodyAcc.Zstd","tGravityAcc.Xmean","tGravityAcc.Ymean",    
       "tGravityAcc.Zmean","tGravityAcc.Xstd","tGravityAcc.Ystd","tGravityAcc.Zstd",   
       "tBodyAccJerk.Xmean","tBodyAccJerk.Ymean","tBodyAccJerk.Zmean","tBodyAccJerk.Xstd",
       "tBodyAccJerk.Ystd","tBodyAccJerk.Zstd","tBodyGyro.Xmean","tBodyGyro.Ymean",
       "tBodyGyro.Zmean","tBodyGyro.Xstd","tBodyGyro.Ystd","tBodyGyro.Zstd",
       "tBodyGyroJerk.Xmean","tBodyGyroJerk.Ymean","tBodyGyroJerk.Zmean",
       "tBodyGyroJerk.Xstd","tBodyGyroJerk.Ystd","tBodyGyroJerk.Zstd","tBodyAccMag.mean",     
       "tBodyAccMag.std","tGravityAccMag.mean","tGravityAccMag.std","tBodyAccJerkMag.mean",
       "tBodyAccJerkMag.std","tBodyGyroMag.mean","tBodyGyroMag.std","tBodyGyroJerkMag.mean",
       "tBodyGyroJerkMag.std","fBodyAcc.Xmean","fBodyAcc.Ymean","fBodyAcc.Zmean",       
       "fBodyAcc.Xstd","fBodyAcc.Ystd","fBodyAcc.Zstd","fBodyAccJerk.Xmean",
       "fBodyAccJerk.Ymean","fBodyAccJerk.Zmean","fBodyAccJerk.Xstd","fBodyAccJerk.Ystd",
       "fBodyAccJerk.Zstd","fBodyGyro.Xmean","fBodyGyro.Ymean","fBodyGyro.Zmean",      
       "fBodyGyro.Xstd","fBodyGyro.Ystd","fBodyGyro.Zstd","fBodyAccMag.mean",
       "fBodyAccMag.std","fBodyAccJerkMag.mean","fBodyAccJerkMag.std",
       "fBodyGyroMag.mean","fBodyGyroMag.std","fBodyGyroJerkMag.mean","fBodyGyroJerkMag.std")
#
Data.act1 <- filter(mergedData, activity == "walking")
dim(Data.act1)
Activity.Data1 <- as.data.frame(sapply(split(select(Data.act1, 3:68), Data.act1$subject.no),colMeans))
dim(Activity.Data1)
Data1 <-  cbind(Activity = "Walking", Variable.averages = Z, Activity.Data1)
dim(Data1)
head(Data1)
#
Data.act2 <- filter(mergedData, activity == "walking up")
dim(Data.act2)
Activity.Data2 <- as.data.frame(sapply(split(select(Data.act2, 3:68), Data.act2$subject.no),colMeans))
dim(Activity.Data2)
Data2 <-  cbind(Activity = "Walking Upstairs", Variable.averages = Z, Activity.Data2)
dim(Data2)
head(Data2)
#
Tot.Data1 <- merge.data.frame(Data1, Data2, all=TRUE, sort=FALSE)
dim(Tot.Data1)
#
Data.act3 <- filter(mergedData, activity == "walking down")
dim(Data.act3)
Activity.Data3 <- as.data.frame(sapply(split(select(Data.act3, 3:68), Data.act3$subject.no),colMeans))
dim(Activity.Data3)
Data3 <-  cbind(Activity = "Walking Downstairs", Variable.averages = Z, Activity.Data3)
dim(Data3)
#
Tot.Data2 <- merge(Tot.Data1, Data3, all=TRUE, sort=FALSE)
dim(Tot.Data2)
#
Data.act4 <- filter(mergedData, activity == "sitting")
dim(Data.act4)
Activity.Data4 <- as.data.frame(sapply(split(select(Data.act4, 3:68), Data.act4$subject.no),colMeans))
dim(Activity.Data4)
Data4 <-  cbind(Activity = "Sitting", Variable.averages = Z, Activity.Data4)
dim(Data4)
#
Tot.Data3 <- merge(Tot.Data2, Data4, all=TRUE, sort=FALSE)
dim(Tot.Data3)
#
Data.act5 <- filter(mergedData, activity == "standing")
dim(Data.act5)
Activity.Data5 <- as.data.frame(sapply(split(select(Data.act5, 3:68), Data.act5$subject.no),colMeans))
dim(Activity.Data5)
Data5 <-  cbind(Activity = "Standing", Variable.averages = Z, Activity.Data5)
dim(Data5)
#
Tot.Data4 <- merge(Tot.Data3, Data5, all=TRUE, sort=FALSE)
dim(Tot.Data4)
#
Data.act6 <- filter(mergedData, activity == "laying")
dim(Data.act6)
Activity.Data6 <- as.data.frame(sapply(split(select(Data.act6, 3:68), Data.act6$subject.no),colMeans))
dim(Activity.Data6)
Data6 <-  cbind(Activity = "Laying", Variable.averages = Z, Activity.Data6)
dim(Data6)
#
Total.Data <- merge(Tot.Data4, Data6, all=TRUE, sort=FALSE)
dim(Total.Data)
#
names(Total.Data)[names(Total.Data)== "1"] <- "Subject.1"
names(Total.Data)[names(Total.Data)== "2"] <- "Subject.2"
names(Total.Data)[names(Total.Data)== "3"] <- "Subject.3"
names(Total.Data)[names(Total.Data)== "4"] <- "Subject.4"
names(Total.Data)[names(Total.Data)== "5"] <- "Subject.5"
names(Total.Data)[names(Total.Data)== "6"] <- "Subject.6"
names(Total.Data)[names(Total.Data)== "7"] <- "Subject.7"
names(Total.Data)[names(Total.Data)== "8"] <- "Subject.8"
names(Total.Data)[names(Total.Data)== "9"] <- "Subject.9"
names(Total.Data)[names(Total.Data)== "10"] <- "Subject.10"
names(Total.Data)[names(Total.Data)== "11"] <- "Subject.11"
names(Total.Data)[names(Total.Data)== "12"] <- "Subject.12"
names(Total.Data)[names(Total.Data)== "13"] <- "Subject.13"
names(Total.Data)[names(Total.Data)== "14"] <- "Subject.14"
names(Total.Data)[names(Total.Data)== "15"] <- "Subject.15"
names(Total.Data)[names(Total.Data)== "16"] <- "Subject.16"
names(Total.Data)[names(Total.Data)== "17"] <- "Subject.17"
names(Total.Data)[names(Total.Data)== "18"] <- "Subject.18"
names(Total.Data)[names(Total.Data)== "19"] <- "Subject.19"
names(Total.Data)[names(Total.Data)== "20"] <- "Subject.20"
names(Total.Data)[names(Total.Data)== "21"] <- "Subject.21"
names(Total.Data)[names(Total.Data)== "22"] <- "Subject.22"
names(Total.Data)[names(Total.Data)== "23"] <- "Subject.23"
names(Total.Data)[names(Total.Data)== "24"] <- "Subject.24"
names(Total.Data)[names(Total.Data)== "25"] <- "Subject.25"
names(Total.Data)[names(Total.Data)== "26"] <- "Subject.26"
names(Total.Data)[names(Total.Data)== "27"] <- "Subject.27"
names(Total.Data)[names(Total.Data)== "28"] <- "Subject.28"
names(Total.Data)[names(Total.Data)== "29"] <- "Subject.29"
names(Total.Data)[names(Total.Data)== "30"] <- "Subject.30"
#
Total.Data[1:3,1:3]
dim(Total.Data)
names(Total.Data)
write.table(Total.Data,"Samsung-Data.txt", sep="\t", row.names=FALSE)
