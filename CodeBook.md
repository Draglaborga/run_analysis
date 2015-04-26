# The Code Book for Getting and Cleaning Data Course Project 

###Overview
This code book describes the variables, the data, and any transformations used in the course project.

###Data Set Description
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data contains two sets: the training data and the test data - in "train" and "test" folders. 
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt' and 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

###Variables in a resulting file tidy_data.txt
- "subject": subject who per performed the activity
- "activity": names of activities
- List of features where:
  - 'Acc': the accelerometer signals, 'Gyro' - the gyroscope signals
  - 'X','Y','Z': 3-axial signals in the X, Y and Z directions
  - 't': denote time
  - 'f': indicate frequency domain signals
  - Mean: Mean value
  - Std: Standard deviation
  - Jerk: Jerk signals
  - Mag: magnitude

###Transformations

#### Getting data
Download data into a 'data' folder and unzip data
#### Step 1. Merge the training and the test sets to create one data set. 
#### Step 2. Extract only the measurements on the mean and standard deviation for each measurement.
#### Step 3. Use descriptive activity names to name the activities in the data set.
#### Step 4. Appropriately labels the data set with descriptive variable names.
#### Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
