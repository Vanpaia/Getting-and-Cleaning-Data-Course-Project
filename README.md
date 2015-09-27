# Getting and Cleaning Data: Course Project

## Introduction

This github repository contains my interpretation of the Coursera cours project for "Getting and Cleaning Data". 

## The raw data

The raw data was a collection of datasets, found in the "Human Activity Recognition Using Smartphones Dataset". The dataset was split into two random sets, the train set consisted of 70% of the subjects and the test set consisted of 30% of the subjects. The datasets were further split from the activity performed. The text file X_ contained the measurements and the text file y_ contained the performed activity in both cases.

## run_analysis.R

### - Why
The created script is meant to merge the different datasets together. From this merged dataset it subsets only the following variables of all measurements:

1. The mean value
2. The standard deviation
3. The mean frequency
4. The averaged signals of the angle() variable

The collection of measurements of these variables are then averaged per subject per activity, outputting a value for each activity that each subject performed. This output is then written into a .txt file and saved in the working directory.

### - How
The script has to be sourced. This can either be done in R through File > Source R Code... or in RStudio through Code > Source File...
Nothing else is required.

### - What
The code first checkes if the relevant libraries are installed and loaded and rectifies that should that not be the case.
Then the code checks whether the dataset is already present in the working directory and if necessary downloads and/or unzips said file.
It reads and merges the different files using rbind.data.frame(). As soon as a file is read into memory its column names are added and cleaned. 
The different datasets are then combined using cbind.data.frame().
The data is then subset, selecting all columns with the word mean and std in it.
The activity code is replaced for the name of the activity, by matching the labels with the numbers.
The column names are then further cleaned to make them better readable and remove the extra periods.
Finally the mean of all the different measurements by subject and activity are created.
This dataset is safed as a .txt with __tab__ as separator so that Microsoft Excel reads the .txt file cleanly.
Finally the script reads where the .txt file is created and lets the user know where to find the created file.

## CodeBook.md

The code book explains the data and its variables as well as the changes that were made to them.