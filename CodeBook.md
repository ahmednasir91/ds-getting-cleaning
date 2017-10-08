## Code Book ##
The data is about the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Variables ##

- First the train and test data is loaded
- `test` has the data from the sensors of 30% volunteers including the subject and activity.
- `train` has data from the sensors of 70% volunteers including the subject and activity.
- `y_test` are the activity labels of the test data.
- `y_train` are the activity labels of the train data.
- `subject_test` is the data about the subjects of test data.
- `subject_train` is the data about the subjects of train data.
- `features` contains **561** features that are collected.
- `merged` data contains the samples of both the `test` & `train` and the labels of activity.
- `activity_labels` labels of the activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
- `mean_std_data` contains only the mean and standard deviation variables of the observations.
- `grouped_data` is the data grouped by Subject and Activity only the variables which have mean and standard deviation.
- `summarised_data` is the summary of the groups with the average of each variable for each activity and subject.

## Summarized Data Variables ##
The variables in the summarized data has tokens like `frequency`, `body`, `gyroscope` joined by a `-`. The description of tokens is below

|Token|Description|
|---|---|
|`time`|Time domain signals which are captured at the fixed frequency of 50Hz.|
|`body`|Readings of the body of the subject.|
|`frequency`|Fast Fourier transform was applied on time domain signals to obtain frequency signals|
|`gravity`|The acceleration signal was separated into body and gravity using the low pass filter.|
|`accelerometer`, `gyroscope`|Sensors that are used to collect the data.|
|`Jerk-magnitude`|The body linear acceleration and angular velocity were derived in time to obtain Jerk signals.|
|`mean`|Mean value|
|`std`|Standard Deviation|
|`X`,`Y`,`Z`|The 3 axis where the data is collected by the sensors.|