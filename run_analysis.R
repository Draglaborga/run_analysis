#Call libraries

library(plyr)

#Download data into a data folder and unzip data

if(!file.exists("./data/data.zip")){
  if(!file.exists("./data")){dir.create("./data")}
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="./data/data.zip")
}

unzip(zipfile="./data/data.zip", exdir="./data")

###################################################################
#STEP1. Merge the training and the test sets to create one data set.
###################################################################

x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)

###################################################################
#STEP2. Extract only the measurements on the mean and standard deviation for each measurement.
###################################################################

features <- read.table("./data/UCI HAR Dataset/features.txt")

mean_features <- grep("-mean\\(\\)", features[, 2])
std_features <- grep("-std\\(\\)", features[, 2])

cols_to_extract <- sort(c(mean_features,std_features))

x <- x[, cols_to_extract]

names(x) <- features[cols_to_extract, 2]

###################################################################
#STEP3. Use descriptive activity names to name the activities in the data set.
###################################################################

activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

y[, 1] <- activities[y[, 1], 2]
names(y) <- "activity"

###################################################################
#STEP4. Appropriately labels the data set with descriptive variable names.
###################################################################

names(subject) <- "subject"

combined_data <- cbind(subject,y,x)

col_names <- names(combined_data)

new_names <- sapply(1:length(col_names), function(i) gsub("\\()|-","", col_names[i]))
new_names <- sapply(1:length(new_names), function(i) gsub("mean","Mean", new_names[i]))
new_names <- sapply(1:length(new_names), function(i) gsub("std","Std", new_names[i]))
new_names <- sapply(1:length(new_names), function(i) gsub("BodyBody","Body", new_names[i]))

names(combined_data) <- new_names

###################################################################
#STEP5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
###################################################################
tidy_data <- ddply(combined_data, .(subject, activity), function(i) colMeans(i[, 3:length(new_names)]))

write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
