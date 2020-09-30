#oading required packages

install.packages("dplR")
install.packages("magrittr")
rm(list=ls())
library(dplR)
library(magrittr)


#Download the dataset if already downloaded

f <- "getdata_projectfiles_UCI HAR Dataset.zip"



# Checking if archieve already exists. else trace from link address

if (!file.exists(f)){
  flink <- "https:/d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(flink, f, method="curl")
}  


# Checking if folder exists else extract from the compressed file

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#Assigning all data frames from the folder named as UCI HAR Dataset

feat <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
act <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subtst <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
xtst <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = feat$functions)
ytst <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subtr <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
xtr <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = feat$functions)
ytr <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
ls()

#Step 1: Merges the training and the test sets to create one data set.

X <- rbind(xtr, xtst)
Y <- rbind(ytr, ytst)
sub <- rbind(subtr, subtst)
m <- cbind(sub, Y, X)
ls()


#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

t <- m %>% select(sub, code, contains("mean"), contains("std"))
#t<- m[, grep("-(mean|std)\\(\\)", read.table("UCI HAR Dataset/features.txt")[, 2])]
t

#Step 3: Uses descriptive activity names to name the activities in the data set.

t$code <- act[t$code, 2]
t$code

#Step 4: Appropriately labels the data set with descriptive variable names.

names(t)[2] = "activity"
names(t)<-gsub("Acc", "Accelerometer", names(t))
names(t)<-gsub("Gyro", "Gyroscope", names(t))
names(t)<-gsub("BodyBody", "Body", names(t))
names(t)<-gsub("Mag", "Magnitude", names(t))
names(t)<-gsub("^t", "Time", names(t))
names(t)<-gsub("^f", "Frequency", names(t))
names(t)<-gsub("tBody", "TimeBody", names(t))
names(t)<-gsub("-mean()", "Mean", names(t), ignore.case = TRUE)
names(t)<-gsub("-std()", "STD", names(t), ignore.case = TRUE)
names(t)<-gsub("-freq()", "Frequency", names(t), ignore.case = TRUE)
names(t)<-gsub("angle", "Angle", names(t))
names(t)<-gsub("gravity", "Gravity", names(t))
names(t)

#Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

fd <- t %>%
  group_by(sub, act) %>%
  summarise_all(funs(mean))
write.table(fd, "FinalData.txt", row.name=FALSE)


#Final Check Stage for Checking variable names

str(fd)