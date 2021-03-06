# Getting and Cleaning Data: Course Project

## Source data

The source data is the 'Human Activity Recognition Using Smartphones Dataset' created by [Smartlab](www.smartlab.ws).

The original dataset can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), thought the run_analysis.R script does this for you.


## Features description

*Original description*

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Transformation

The different datasets were merged

The dataset is subset to only the mean and standard devation variables. Not only the mean() and std() variables were chosen, but also the angle() variables that were mean values, as that fit the description of the excercise better.

The activity names replaced the activity identifier

The labels were made more tidy

The mean of different measurements of the same subject and activity was taken


## Tidy data

The first variable is an identifier, the subject number which carried out the activity

The second variable is an activity

The later variables are the measurements

The original data has been subset as well as transformed, the naming convention has stayed the same, however, the abbreviations have been expanded as well as the capitalization fixed to comply with tidy data standards.

The subset variables are the mean value, recognizable by the word "Mean" in front of the axial direction, and the standard deviation, recognizable by the word "StandardDeviation" in the same place. The angle variable can be recognized by the word "Angle" in front.

The features are normalized and bounded within [-1, 1]. This means that the measurements in the dataset don't have units but merely a normalized value between -1 and 1. This also explains why the standard deviation can be under 0.

The original measurements were:
linear acceleration alfa =  m/s^2^
and 3-axial angular velocity
omega = rad/s^2^

The selected data still had a number of measurements per subject per activity. Of these measurements the tidy data gives the average.

The selected data is the following:

*	Subject
*	Activity
*	TimeBodyAccelerometerMeanX
*	TimeBodyAccelerometerMeanY
*	TimeBodyAccelerometerMeanZ
*	TimeGravityAccelerometerMeanX
*	TimeGravityAccelerometerMeanY
*	TimeGravityAccelerometerMeanZ
*	TimeBodyAccelerometerJerkMeanX
*	TimeBodyAccelerometerJerkMeanY
*	TimeBodyAccelerometerJerkMeanZ
*	TimeBodyGyroscopeMeanX
*	TimeBodyGyroscopeMeanY
*	TimeBodyGyroscopeMeanZ
*	TimeBodyGyroscopeJerkMeanX
*	TimeBodyGyroscopeJerkMeanY
*	TimeBodyGyroscopeJerkMeanZ
*	TimeBodyAccelerometerMagnitudeMean
*	TimeGravityAccelerometerMagnitudeMean
*	TimeBodyAccelerometerJerkMagnitudeMean
*	TimeBodyGyroscopeMagnitudeMean
*	TimeBodyGyroscopeJerkMagnitudeMean
*	FrequencyBodyAccelerometerMeanX
*	FrequencyBodyAccelerometerMeanY
*	FrequencyBodyAccelerometerMeanZ
*	FrequencyBodyAccelerometerMeanFrequencyX
*	FrequencyBodyAccelerometerMeanFrequencyY
*	FrequencyBodyAccelerometerMeanFrequencyZ
*	FrequencyBodyAccelerometerJerkMeanX
*	FrequencyBodyAccelerometerJerkMeanY
*	FrequencyBodyAccelerometerJerkMeanZ
*	FrequencyBodyAccelerometerJerkMeanFrequencyX
*	FrequencyBodyAccelerometerJerkMeanFrequencyY
*	FrequencyBodyAccelerometerJerkMeanFrequencyZ
*	FrequencyBodyGyroscopeMeanX
*	FrequencyBodyGyroscopeMeanY
*	FrequencyBodyGyroscopeMeanZ
*	FrequencyBodyGyroscopeMeanFrequencyX
*	FrequencyBodyGyroscopeMeanFrequencyY
*	FrequencyBodyGyroscopeMeanFrequencyZ
*	FrequencyBodyAccelerometerMagnitudeMean
*	FrequencyBodyAccelerometerMagnitudeMeanFrequency
*	FrequencyBodyAccelerometerJerkMagnitudeMean
*	FrequencyBodyAccelerometerJerkMagnitudeMeanFrequency
*	FrequencyBodyGyroscopeMagnitudeMean
*	FrequencyBodyGyroscopeMagnitudeMeanFrequency
*	FrequencyBodyGyroscopeJerkMagnitudeMean
*	FrequencyBodyGyroscopeJerkMagnitudeMeanFrequency
*	AngleTimeBodyAccelerometerMeanGravity
*	AngleTimeBodyAccelerometerJerkMeanGravityMean
*	AngleTimeBodyGyroscopeMeanGravityMean
*	AngleTimeBodyGyroscopeJerkMeanGravityMean
*	AngleXGravityMean
*	AngleYGravityMean
*	AngleZGravityMean
*	TimeBodyAccelerometerStandardDeviationX
*	TimeBodyAccelerometerStandardDeviationY
*	TimeBodyAccelerometerStandardDeviationZ
*	TimeGravityAccelerometerStandardDeviationX
*	TimeGravityAccelerometerStandardDeviationY
*	TimeGravityAccelerometerStandardDeviationZ
*	TimeBodyAccelerometerJerkStandardDeviationX
*	TimeBodyAccelerometerJerkStandardDeviationY
*	TimeBodyAccelerometerJerkStandardDeviationZ
*	TimeBodyGyroscopeStandardDeviationX
*	TimeBodyGyroscopeStandardDeviationY
*	TimeBodyGyroscopeStandardDeviationZ
*	TimeBodyGyroscopeJerkStandardDeviationX
*	TimeBodyGyroscopeJerkStandardDeviationY
*	TimeBodyGyroscopeJerkStandardDeviationZ
*	TimeBodyAccelerometerMagnitudeStandardDeviation
*	TimeGravityAccelerometerMagnitudeStandardDeviation
*	TimeBodyAccelerometerJerkMagnitudeStandardDeviation
*	TimeBodyGyroscopeMagnitudeStandardDeviation
*	TimeBodyGyroscopeJerkMagnitudeStandardDeviation
*	FrequencyBodyAccelerometerStandardDeviationX
*	FrequencyBodyAccelerometerStandardDeviationY
*	FrequencyBodyAccelerometerStandardDeviationZ
*	FrequencyBodyAccelerometerJerkStandardDeviationX
*	FrequencyBodyAccelerometerJerkStandardDeviationY
*	FrequencyBodyAccelerometerJerkStandardDeviationZ
*	FrequencyBodyGyroscopeStandardDeviationX
*	FrequencyBodyGyroscopeStandardDeviationY
*	FrequencyBodyGyroscopeStandardDeviationZ
*	FrequencyBodyAccelerometerMagnitudeStandardDeviation
*	FrequencyBodyAccelerometerJerkMagnitudeStandardDeviation
*	FrequencyBodyGyroscopeMagnitudeStandardDeviation
*	FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
