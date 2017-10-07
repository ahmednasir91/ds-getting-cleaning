# dplyr - used for grouping and summarizing the data
library(dplyr)

# set the working directory
setwd("~/Downloads/UCI HAR Dataset")
# read the test data set
test <- read.table("test/X_test.txt", na.strings="")
y_test <- read.table("test/y_test.txt", na.strings="")
subject_test <- read.table("test/subject_test.txt", na.strings="")

# read the test data set
train <- read.table("train/X_train.txt", na.strings="")
y_train <- read.table("train/y_train.txt", na.strings="")
subject_train <- read.table("train/subject_train.txt", na.strings="")

# Read features
features <- read.table("features.txt")

# Set features as train dataframe column names
colnames(train) <- features$V2
# Prepend the subject & activity columns in train
train <- cbind(subject = subject_train$V1, activity = y_train$V1, train)

# Set features as test dataframe column names
colnames(test) <- features$V2
# Prepend the subject & activity columns in test
test <- cbind(subject = subject_test$V1, activity = y_test$V1, test)

# Merge the data
merged <- rbind(train, test)

# Read activity labels
activity_labels <- read.table("activity_labels.txt", na.strings="")

# Set the activity number to labels
merged$activity <- activity_labels$V2[merged$activity]

# Select only columns which have `mean()` or `std()`
mean_std_data = merged[,colnames(merged)[grep("mean\\(\\)|std\\(\\)|activity|subject", colnames(merged))]]

# Update column names
colnames(mean_std_data) <- sub("tG", "time-g", sub("tB", "time-b", sub("fBody", "frequency-body-", sub("\\(\\)", "", colnames(mean_std_data)))))

# Group the data by Subject and then Activity
grouped_data <- group_by(mean_std_data, subject, activity)

# Summarize the data with mean of each subject-activity observation
summarised_data <- summarize_all(grouped_data, function(x) mean(x, na.rm = TRUE))