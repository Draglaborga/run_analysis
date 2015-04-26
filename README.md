## Getting and Cleaning Data Course Project

# Otherview
This repo is a course project for the course "Getting and Cleaning data" available in Coursera.
The goal is to collect and prepare tidy data that can be used for later analysis. 
The source data for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Project steps description
 
Create one R script called run_analysis.R that does the following. 
  1.  Merges the training and the test sets to create one data set.
  2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
  3.  Uses descriptive activity names to name the activities in the data set
  4.  Appropriately labels the data set with descriptive variable names. 
  5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Content
run_analysis.R - contains the R code that does all 5 steps above. It takes the source data from the link above.
At the 5 step it returns a data frame in a tidy_data.txt file saved in a work directory.
CodeBook.md describes variables and transformation work that was performed to clean up the data.
