---
Title: "CodeBook"
output: github_document
---
## Generating the Test Data
### Downloading and listing the data files for analysis

```r
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./getdata-projectfiles-UCI_HAR_Dataset.zip", method="curl")
unzip("getdata-projectfiles-UCI_HAR_Dataset.zip", exdir="UCIDataset")
list.files("UCIDataset")
list.files("UCIDataset/test")
list.files("UCIDataset/train")
```
### Reading in the data files from the Test directory


```r
data.subtest <- fread("./test/subject_test.txt",
                      sep=" ", na.strings = c("NA", "N/A", "null", "?"))
Test.subject <- rename(data.subtest, subject.no =V1)
dim(Test.subject)
```

```
## [1] 2947    1
```
### These volunteers were chosen at random as subjects for generating the test data

```r
table(Test.subject)
```

```
## Test.subject
##   2   4   9  10  12  13  18  20  24 
## 302 317 288 294 320 327 364 354 381
```

```r
#
data.xtest <- fread("./test/X_test.txt", sep=" ", na.strings = c("NA", "N/A", "null", "?"))
dim(data.xtest)
```

```
## [1] 2947  561
```

```r
#
data.ytest <- fread("./test/y_test.txt", sep=" ", na.strings = c("NA", "N/A", "null", "?"))
Test.activity <- rename(data.ytest, activity =V1)
dim(Test.activity)
```

```
## [1] 2947    1
```

```r
table(Test.activity)
```

```
## Test.activity
##   1   2   3   4   5   6 
## 496 471 420 491 532 537
```
### For Test Data: Extracting only the mean & standard deviations for each measurement variable

```r
Time.test.Data <- select(data.xtest, V1:V6, V41:V46, V81:V86, V121:126, V161:V166, 
                         V201, V202, V214, V215, V227, V228, V240, V241, V253, V254,
                         V266:V271, V345:V350, V424:V429,
                         V503, V504, V516, V517, V529, V530, V542, V543)
```
### GENERATING the dataframe for test data by joining the subject and activity dataframes together

```r
testData <- as.data.frame(cbind(Test.subject, Test.activity, Time.test.Data))
dim(testData)
names(testData)
```
### Labeling the test data set with descriptive variable names

### Using descriptive activity labels to name the activities

```r
Total.testData$activity <- gsub("1","walking", Total.testData$activity)     
Total.testData$activity <- gsub("2","walking up", Total.testData$activity)
Total.testData$activity <- gsub("3","walking down", Total.testData$activity)
Total.testData$activity <- gsub("4","sitting", Total.testData$activity)
Total.testData$activity <- gsub("5","standing", Total.testData$activity)
Total.testData$activity <- gsub("6","laying", Total.testData$activity)  
head(Total.testData)
```
## Generating the Train Data
### Reading in the data files from the Train directory

```r
data.subtrain <- fread("./train/subject_train.txt",
                       sep=" ", na.strings = c("NA", "N/A", "null", "?"))
Train.subject <- rename(data.subtrain, subject.no =V1)
dim(Train.subject)
```

```
## [1] 7352    1
```
### These volunteers were chosen at random as subjects for generating the train data

```r
table(Train.subject)
```

```
## Train.subject
##   1   3   5   6   7   8  11  14  15  16  17  19  21  22  23  25  26  27 
## 347 341 302 325 308 281 316 323 328 366 368 360 408 321 372 409 392 376 
##  28  29  30 
## 382 344 383
```

```r
#
data.xtrain <- fread("./train/X_train.txt",
                     sep=" ", na.strings = c("NA", "N/A", "null", "?"))
dim(data.xtrain)
```

```
## [1] 7352  561
```

```r
#
data.ytrain <- fread("./train/y_train.txt",
                     sep=" ", na.strings = c("NA", "N/A", "null", "?"))
Train.activity <- rename(data.ytrain, activity =V1)
dim(Train.activity)
```

```
## [1] 7352    1
```

```r
table(Train.activity)    
```

```
## Train.activity
##    1    2    3    4    5    6 
## 1226 1073  986 1286 1374 1407
```
### For Training Data: Extracting only the mean & standard deviations for each measurement variable

```r
Time.train.Data <- select(data.xtrain, V1:V6, V41:V46, V81:V86, V121:126, V161:V166, 
                          V201, V202, V214, V215, V227, V228, V240, V241, V253, V254,
                          V266:V271, V345:V350, V424:V429,
                          V503, V504, V516, V517, V529, V530, V542, V543)
```
### GENERATING the dataframe for training data by binding the subject and activity dataframes together

```r
trainData <- as.data.frame(cbind(Train.subject, Train.activity, Time.train.Data))
dim(trainData)
```

```
## [1] 7352   68
```
### Labeling the train data set with descriptive variable names

```
## [1] 7352   68
```
### Using descriptive activity labels to name the activities

```r
Total.trainData$activity <- gsub("1","walking", Total.trainData$activity)     
Total.trainData$activity <- gsub("2","walking up", Total.trainData$activity)
Total.trainData$activity <- gsub("3","walking down", Total.trainData$activity)
Total.trainData$activity <- gsub("4","sitting", Total.trainData$activity)
Total.trainData$activity <- gsub("5","standing", Total.trainData$activity)
Total.trainData$activity <- gsub("6","laying", Total.trainData$activity)  
Total.trainData[330:350,]
```
### Merging the test data and the train data

```r
mergedData <- merge(Total.testData, Total.trainData, all=TRUE)
dim(mergedData)
```

```
## [1] 10299    68
```

```r
names(mergedData)
```

```
##  [1] "subject.no"            "activity"             
##  [3] "tBodyAcc.Xmean"        "tBodyAcc.Ymean"       
##  [5] "tBodyAcc.Zmean"        "tBodyAcc.Xstd"        
##  [7] "tBodyAcc.Ystd"         "tBodyAcc.Zstd"        
##  [9] "tGravityAcc.Xmean"     "tGravityAcc.Ymean"    
## [11] "tGravityAcc.Zmean"     "tGravityAcc.Xstd"     
## [13] "tGravityAcc.Ystd"      "tGravityAcc.Zstd"     
## [15] "tBodyAccJerk.Xmean"    "tBodyAccJerk.Ymean"   
## [17] "tBodyAccJerk.Zmean"    "tBodyAccJerk.Xstd"    
## [19] "tBodyAccJerk.Ystd"     "tBodyAccJerk.Zstd"    
## [21] "tBodyGyro.Xmean"       "tBodyGyro.Ymean"      
## [23] "tBodyGyro.Zmean"       "tBodyGyro.Xstd"       
## [25] "tBodyGyro.Ystd"        "tBodyGyro.Zstd"       
## [27] "tBodyGyroJerk.Xmean"   "tBodyGyroJerk.Ymean"  
## [29] "tBodyGyroJerk.Zmean"   "tBodyGyroJerk.Xstd"   
## [31] "tBodyGyroJerk.Ystd"    "tBodyGyroJerk.Zstd"   
## [33] "tBodyAccMag.mean"      "tBodyAccMag.std"      
## [35] "tGravityAccMag.mean"   "tGravityAccMag.std"   
## [37] "tBodyAccJerkMag.mean"  "tBodyAccJerkMag.std"  
## [39] "tBodyGyroMag.mean"     "tBodyGyroMag.std"     
## [41] "tBodyGyroJerkMag.mean" "tBodyGyroJerkMag.std" 
## [43] "fBodyAcc.Xmean"        "fBodyAcc.Ymean"       
## [45] "fBodyAcc.Zmean"        "fBodyAcc.Xstd"        
## [47] "fBodyAcc.Ystd"         "fBodyAcc.Zstd"        
## [49] "fBodyAccJerk.Xmean"    "fBodyAccJerk.Ymean"   
## [51] "fBodyAccJerk.Zmean"    "fBodyAccJerk.Xstd"    
## [53] "fBodyAccJerk.Ystd"     "fBodyAccJerk.Zstd"    
## [55] "fBodyGyro.Xmean"       "fBodyGyro.Ymean"      
## [57] "fBodyGyro.Zmean"       "fBodyGyro.Xstd"       
## [59] "fBodyGyro.Ystd"        "fBodyGyro.Zstd"       
## [61] "fBodyAccMag.mean"      "fBodyAccMag.std"      
## [63] "fBodyAccJerkMag.mean"  "fBodyAccJerkMag.std"  
## [65] "fBodyGyroMag.mean"     "fBodyGyroMag.std"     
## [67] "fBodyGyroJerkMag.mean" "fBodyGyroJerkMag.std"
```
## Working with the Merged Data

### Selecting the measurement variables for all subjects performing "walking" activity

```r
Data.act1 <- filter(mergedData, activity == "walking")
dim(Data.act1)
```
### Calculating the averages of all the measurement variables for each subject performing the activity

```r
Activity.Data1 <- as.data.frame(sapply(split(select(Data.act1, 3:68), Data.act1$subject.no),colMeans))
dim(Activity.Data1)
```

```
## [1] 66 30
```
### Generating the data frame with variable averages for all subjects performing "walking" activity

```r
Data1 <-  cbind(Activity = "Walking", Variable.averages = Z, Activity.Data1)
dim(Data1)
```

```
## [1] 66 32
```
### Selecting the variable measurements for all subjects performing "walking upstairs" activity

```r
Data.act2 <- filter(mergedData, activity == "walking up")
dim(Data.act2)
```
### Calculating the averages of all the measurement variables for each subject performing the activity

```r
Activity.Data2 <- as.data.frame(sapply(split(select(Data.act2, 3:68), Data.act2$subject.no),colMeans))
dim(Activity.Data2)
```
### Generating the data frame with variable averages for all subjects performing "walking upstairs" activity

```r
Data2 <-  cbind(Activity = "Walking Upstairs", Variable.averages = Z, Activity.Data2)
dim(Data2)
```

```
## [1] 66 32
```
### Merging the first two datasets and verifying the dimensions of the merged dataframe

```r
Tot.Data1 <- merge.data.frame(Data1, Data2, all=TRUE, sort=FALSE)
dim(Tot.Data1)
```

```
## [1] 132  32
```
### Selecting the variable measurements for all subjects performing "walking downstairs" activity

```r
Data.act3 <- filter(mergedData, activity == "walking down")
dim(Data.act3)
```
### Calculating the averages of all the measurement variables for each subject performing the activity

```r
Activity.Data3 <- as.data.frame(sapply(split(select(Data.act3, 3:68), Data.act3$subject.no),colMeans))
dim(Activity.Data3)
```
### Generating the data frame with variable averages for all subjects performing "walking downstairs" activity

```r
Data3 <-  cbind(Activity = "Walking Downstairs", Variable.averages = Z, Activity.Data3)
dim(Data3)
```
### Merging the third dataset to the first two and verifying the dimensions of the merged dataframe

```r
Tot.Data2 <- merge(Tot.Data1, Data3, all=TRUE, sort=FALSE)
dim(Tot.Data2)
```

```
## [1] 198  32
```
### Selecting the variable measurements for all subjects performing "sitting" activity

```r
Data.act4 <- filter(mergedData, activity == "sitting")
dim(Data.act4)
```
### Calculating the averages of all the measurement variables for each subject performing the activity

```r
Activity.Data4 <- as.data.frame(sapply(split(select(Data.act4, 3:68), Data.act4$subject.no),colMeans))
dim(Activity.Data4)
```
### Generating the data frame with variable averages for all subjects performing "sitting" activity

```r
Data4 <-  cbind(Activity = "Sitting", Variable.averages = Z, Activity.Data4)
dim(Data4)
```
### Merging the fourth dataset to the first three and verifying the dimensions of the merged dataframe

```r
Tot.Data3 <- merge(Tot.Data2, Data4, all=TRUE, sort=FALSE)
dim(Tot.Data3)
```

```
## [1] 264  32
```
### Selecting the variable measurements for all subjects performing "standing" activity

```r
Data.act5 <- filter(mergedData, activity == "standing")
dim(Data.act5)
```
### Calculating the averages of all the measurement variables for each subject performing the activity

```r
Activity.Data5 <- as.data.frame(sapply(split(select(Data.act5, 3:68), Data.act5$subject.no),colMeans))
dim(Activity.Data5)
```
### Generating the data frame with variable averages for all subjects performing "standing" activity

```r
Data5 <-  cbind(Activity = "Standing", Variable.averages = Z, Activity.Data5)
dim(Data5)
```
### Merging the fifth dataset to the first four and verifying the dimensions of the merged dataframe

```r
Tot.Data4 <- merge(Tot.Data3, Data5, all=TRUE, sort=FALSE)
dim(Tot.Data4)
```

```
## [1] 330  32
```
### Selecting the variable measurements for all subjects performing "laying" activity

```r
Data.act6 <- filter(mergedData, activity == "laying")
dim(Data.act6)
```
### Calculating the averages of all the measurement variables for each subject performing the activity

```r
Activity.Data6 <- as.data.frame(sapply(split(select(Data.act6, 3:68), Data.act6$subject.no),colMeans))
dim(Activity.Data6)
```
### Generating the data frame with variable averages for all subjects performing "laying" activity

```r
Data6 <-  cbind(Activity = "Laying", Variable.averages = Z, Activity.Data6)
dim(Data6)
```
### Merging the sixth dataset to the first five and verifying the dimensions of the merged dataframe
### This is the total data set which contains the variable averages for all the subjects (1 to 30) for each of the six measured activities

```r
Total.Data <- merge(Tot.Data4, Data6, all=TRUE, sort=FALSE)
dim(Total.Data)
```

```
## [1] 396  32
```
### Giving appropriate labels to the 30 volunteers

## Writing the new data set to an output file
### The output file contains the variable averages for all the measurements that were taken for each of the volunteers (subjects 1 to 30), performing each of the six activities

```r
write.csv(Total.Data,"Samsung-Data2.csv",row.names=TRUE)
write.table(Total.Data,"Samsung-Data.txt",sep="\t", row.names=TRUE)
```
