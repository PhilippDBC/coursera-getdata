
# libraries
# =================================================================================================
library(plyr)

# config
# =================================================================================================
setwd('/Users/pknuesel/courseproject/UCI HAR Dataset/')
filename_averages <-'avgs_data.txt'


# 1. Merges the training and the test sets to create one data set
# =================================================================================================

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create 'x' data set
x_data <- rbind(x_train, x_test)
rm(x_train)
rm(x_test)

# create 'y' data set
y_data <- rbind(y_train, y_test)
rm(y_train)
rm(y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)
rm(subject_train)
rm(subject_test)


# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement
# =================================================================================================

features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset these columns
x_data <- x_data[, mean_std_features]

# adjust the column names
names(x_data) <- features[mean_std_features, 2]

# keep number of columns
cols <- ncol(x_data)


# 3. Uses descriptive activity names to name the activities in the data set
# =================================================================================================

activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# adjust the column name
names(y_data) <- "activity"


# 4. Appropriately labels the data set with descriptive variable names
# =================================================================================================

# adjust column name
names(subject_data) <- "subject"

# bind all the data in a single data set
data <- cbind(x_data, y_data, subject_data)


# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
# =================================================================================================

# calc averages for each subject, activity measure
avgs_data <- ddply(data, .(subject, activity), function(x) colMeans(x[, 1:cols]))

# write file
write.table(avgs_data, filename_averages, row.name=FALSE)

# =================================================================================================
# end