#Chech for needed libraries and load them
library(plyr)

#download data and set working directory


## 1. Merges the training and test sets to create one data set:
##Test Data
X_Test <- read.table("./test/X_test.txt")
Y_Test <- read.table("./test/Y_test.txt")
subject_test <- read.table  ("./test/subject_test.txt")

##Train Data
X_Train <- read.table("./train/X_train.txt")
Y_Train <- read.table("./train/Y_train.txt")
subject_train <- read.table  ("./train/subject_train.txt")

##Create an 'x', 'y', and 'subject' data set
X_data <- rbind(X_Test, X_Train)

Y_data <- rbind(Y_Test, Y_Train)

Subject_data <-rbind(subject_test, subject_train)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement:
#mean and standard deviation 
features <- read.table("features.txt")

mean_stdev_features <- grep("-(mean|std)\\(\\)", features[, 2])
X_data <- X_data[, mean_stdev_features]
names(X_data) <- features[mean_stdev_features, 2]

## 3. Uses descriptive activity names to name the activities in the data set:
Activities <- read.table("activity_labels.txt")
Y_data[, 1] <- Activities[Y_data[, 1], 2]
names(Y_data) <-"activity"


## 4. Appropriately labels the data set with descriptive variable names
names(Subject_data) <- "subject"
All_data_combined <- cbind(X_data, Y_data, Subject_data)

## 5. From data set in set 4. create a second, independent tidy data set with the average of each 
##variable for each activity and each subject 

Average_data <-ddply(All_data_combined, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(Average_data, "tidy_data.txt", row.name = FALSE)
