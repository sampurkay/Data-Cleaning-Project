# Data-Cleaning-Project
The purpose of this project is to collect, work with, and clean an original data set. The final goal is to generate a new, tidy data set that could be used for later analysis.             
The original data set was generated from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years.       
Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
                            
Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The obtained dataset were randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.
              
7 Volunteers selected for generating the test data were the following:              
2 4 9 10 12 13 18 20 24                     
                  
21 Volunteers selected for generating the test data were the following:               
1 3 5 6 7 8 11 14 15 16 17 19 21 22 23 25 26 27 28 29 30              
                    
In the original database, the following data is provided for each record:
=========================================================================
-   Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.            
-   Triaxial Angular velocity from the gyroscope.         
-   A 561-feature vector with time and frequency domain variables.                        
-   Its activity label (from 1 to 6). The activities are identified as the following.                                                    
        1 WALKING                          
        2 WALKING\_UPSTAIRS                               
        3 WALKING\_DOWNSTAIRS                                  
        4 SITTING                                
        5 STANDING                                    
        6 LAYING                                            
-   An identifier of the subject who carried out the experiment (subjects 1 to 30).                       
                          
Feature Selection in the orginal database
=========================================
The features in the original database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (with prefix 't') were captured at a constant rate of 50 Hz. The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
                                        
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
                                    
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note that 'f' indicates frequency domain signals).
                                                        
These signals were used to estimate variables of the feature vector for each pattern:                       
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.                        
                                                    
tBodyAcc-XYZ                    
tGravityAcc-XYZ                         
tBodyAccJerk-XYZ                  
tBodyGyro-XYZ               
tBodyGyroJerk-XYZ               
tBodyAccMag                 
tGravityAccMag                  
tBodyAccJerkMag                 
tBodyGyroMag                  
tBodyGyroJerkMag                  
fBodyAcc-XYZ                    
fBodyAccJerk-XYZ                    
fBodyGyro-XYZ                     
fBodyAccMag                         
fBodyAccJerkMag                       
fBodyGyroMag                      
fBodyGyroJerkMag                    
                                                        
Additional vectors were obtained by averaging the signals in a signal window sample. These are used on the angle() variable:                                            
gravityMean                     
tBodyAccMean                    
tBodyAccJerkMean                  
tBodyGyroMean                     
tBodyGyroJerkMean                 
                                              
Feature selection for this analysis
===================================
Of the total set of variables estimated from the above signals, the set of variables selected for this                      
included only the Mean value and Standard deviation variables of the feature vector.                                              
The following 66 measurement variables were selected in all; shown below with their respective units of measurement.                                    
                                             
tBodyAcc-XYZ: (Units in meter/second^2)                         
tBodyAcc.Xmean, tBodyAcc.Ymean, tBodyAcc.Zmean                  
tBodyAcc.Xstd, tBodyAcc.Ystd, tBodyAcc.Zstd               
                                          
tGravityAcc-XYZ: (Units in meter/second^2)                        
tGravityAcc.Xmean, tGravityAcc.Ymean, tGravityAcc.Zmean                     
tGravityAcc.Xstd, tGravityAcc.Ystd, tGravityAcc.Zstd                    
tBodyAccJerk-XYZ: (Units in meter/second^2)                         
tBodyAccJerk.Xmean, tBodyAccJerk.Ymean, tBodyAccJerk.Zmean                        
tBodyAccJerk.Xstd, tBodyAccJerk.Ystd, tBodyAccJerk.Zstd                     
                                                                    
tBodyGyro-XYZ: (Units in radians/second)                        
tBodyGyro.Xmean, tBodyGyro.Ymean, tBodyGyro.Zmean                       
tBodyGyro.Xstd, tBodyGyro.Ystd, tBodyGyro.Zstd                      
                                                    
tBodyGyroJerk-XYZ: (Units in radians/second)                                    
tBodyGyroJerk.Xmean, tBodyGyroJerk.Ymean, tBodyGyroJerk.Zmean                       
tBodyGyroJerk.Xstd, tBodyGyroJerk.Ystd, tBodyGyroJerk.Zstd                        
                                                   
(The following have units in meter/second^2)                        
tBodyAccMag.mean, tBodyAccMag.std                                                   
tGravityAccMag.mean, tGravityAccMag.std                    
tBodyAccJerkMag.mean, tBodyAccJerkMag.std                         
                                                    
(The following have units in radians/second)                    
tBodyGyroMag.mean, tBodyGyroMag.std                             
tBodyGyroJerkMag.mean, tBodyGyroJerkMag.std                     
                                                                      
fBodyAcc-XYZ: (Units in meter/second^2)                       
fBodyAcc.Xmean, fBodyAcc.Ymean, fBodyAcc.Zmean              
fBodyAcc.Xstd, fBodyAcc.Ystd, fBodyAcc.Zstd               
                                                                          
fBodyAccJerk-XYZ: (Units in meter/second^2)                           
fBodyAccJerk.Xmean, fBodyAccJerk.Ymean, fBodyAccJerk.Zmean                    
fBodyAccJerk.Xstd, fBodyAccJerk.Ystd, fBodyAccJerk.Zstd                     
                                                                            
fBodyGyro-XYZ: (Units in radians/second)                          
fBodyGyro.Xmean, fBodyGyro.Ymean, fBodyGyro.Zmean                       
fBodyGyro.Xstd, fBodyGyro.Ystd, fBodyGyro.Zstd                        
                                                              
(The following have units in meter/second^2)                            
fBodyAccMag.mean, fBodyAccMag.std                           
fBodyAccJerkMag.mean, fBodyAccJerkMag.std                               
                                                                                    
(The following have units in radians/second)                      
fBodyGyroMag.mean, fBodyGyroMag.std                             
fBodyGyroJerkMag.mean, fBodyGyroJerkMag.std                             
                                                      
Steps in the Analysis
===================== 
1. The mean and standard deviation variables were extracted from the database for the above selected                  
   features. They numbered 66 in all.                              
2. For both the test and train data, dataframes were generated that showed the subjects in the first  
   column, the activity being performed in the second and the corresponding measurement variables extraced    
   from the original database in the columns 3 to 68.                     
3. The test dataframe and the train dataframes were then merged to generated one single dataframe.                 
   The resultant dataframe has 10299 rows and 68 columns.                       
4. From the merged dataframe, measurement variables were then filtered for each activity being performed                 
   for all of the subjects. The averages of all these measurement variables were then calculated for each              
   subject variable (numbered 1 to 30).                           
5. The datasets so generated for each of the six activities were then merged to form the total dataset.                              
   In this new dataset, each row first identifies the activity being performed (in column 1), then gives the                      
   average of the measurement variable selected (in column 2) for each of the subjects (descriptively                      
   named subject.1, subject.2,......subject.30) in columns 3 to 32. This dataframe with 396 rows and 32                     
   columns was then saved to an output txt file (Samsung-Data.txt).                         
