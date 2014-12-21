## Coursera - Getting and Cleaning Data - Course Project

Philipp, 2014-12-21

Submission of the course project for the 'Getting and Cleaning Data course'.

Information about data, variables and transformations used in run_analysis.R

### Source Data
A full description of the data set can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: 
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Check the README.txt file within the zip file for further details about this dataset.

### Attribute Information:
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## run_analysis 

run_analysis.R performs the 5 steps as in course project's definition.

#### 1. Merge the training and the test sets to create one data set.
x_(train|test) files,
y_(train|test) files, 
subject_(train|test) files are merged together using rbind()

#### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Columns with mean and standard deviation measures are taken from features.txt.
These columns are extracted from the x_data dataset

#### 3. Uses descriptive activity names to name the activities in the data set
Descriptive activity names are taken from activity_labels.txt

#### 4. Appropriately labels the data set with descriptive variable names.
subject and activity + columns from step 2

#### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Calculate averages for every measure and write dataframe into txt file.
30 subjects * 6 activities = 180 records.