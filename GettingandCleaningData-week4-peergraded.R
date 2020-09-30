install.packages("dplR")
rm(list=ls())
library(dplyr)

f <- "getdata_projectfiles_UCI HAR Dataset.zip"

# Checking if archieve already exists.
if (!file.exists(filename)){
  flink <- "https:/d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(flink, f, method="curl")
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

feat <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
act <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subtst <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
xtst <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
ytst <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subtr <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
xtr <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
ytr <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")


