# Project Assignment - Getting and Cleaning Data

## Load Packages used in this Script
library(plyr)
library(dplyr)

## Check if Data Files Exist

train_file <- "UCI HAR Dataset/train/X_train.txt"
train.id_file <- "UCI HAR Dataset/train/subject_train.txt"
train.act_file <- "UCI HAR Dataset/train/y_train.txt"
test_file <- "UCI HAR Dataset/test/X_test.txt"
test.id_file <- "UCI HAR Dataset/test/subject_test.txt"
test.act_file <- "UCI HAR Dataset/test/y_test.txt"
varlabel_file <- "UCI HAR Dataset/features.txt"
actlabel_file <- "UCI HAR Dataset/activity_labels.txt"

files <- c(train_file, train.id_file, train.act_file, test_file, 
               test.id_file, test.act_file, varlabel_file, actlabel_file)
file_test <- file.exists(files)
if(!all(file_test)) {
      stop("Missing Data Files: ", files[file_test == FALSE])
}

## Read Data Files, Assign to Objects in R and Include Descriptive Labels for Each Variable

varlabel <- read.table(varlabel_file)[, 2]
actlabel <- read.table(actlabel_file, col.names = c("ActivityCode", "ActivityName"))
ds_train <- read.table(train_file, col.names = varlabel)
id_train <- read.table(train.id_file, col.names = "SubjectId")
act_train <- read.table(train.act_file, col.names = "ActivityCode")
ds_test <- read.table(test_file, col.names = varlabel)
id_test <- read.table(test.id_file, col.names = "SubjectId")
act_test <- read.table(test.act_file, col.names = "ActivityCode")

## Merge Datasets and Include Descriptive Names of Activities

act_train_descriptive <- join(act_train, actlabel, by = "ActivityCode")
act_test_descriptive <- join(act_test, actlabel, by="ActivityCode")
ds_train_complete <- cbind(id_train, act_train_descriptive, ds_train)
ds_test_complete <- cbind(id_test, act_test_descriptive, ds_test)
ds_complete <- rbind(ds_train_complete, ds_test_complete)

## Extract Mean and Standard Deviation Variables for the First Tidy Dataset
## and Sort by SubjectID and ActivityCode

extract <- c(1:3, grep("^.*mean", names(ds_complete)), grep("^.*std", names(ds_complete)))
ds_tidy1 <- arrange(ds_complete[, extract], SubjectId, ActivityCode)

## Create Second Tidy Dataset caclulating Average for each Activity and Subject

ds_tidy2 <- ddply(ds_tidy1, .(SubjectId, ActivityCode, ActivityName), colwise(mean))
write.table(ds_tidy2, "tidy2.txt", row.names = FALSE)

