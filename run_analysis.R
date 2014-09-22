## Install reshape2 if not already
if (!require("reshape2")) {install.packages("reshape2") 
require("reshape2")} 


## GET THE SUBJECTS
## Get the subject data
subject_train <- read.table("C:/Users/Gary/OneDrive/Data Science/3. Getting and Cleaning Data/Project/Wearable/GitProject/RunAnalysis/UCI HAR Dataset/train/subject_train.txt", quote="\"", stringsAsFactors=FALSE)
subject_test <- read.table("C:/Users/Gary/OneDrive/Data Science/3. Getting and Cleaning Data/Project/Wearable/GitProject/RunAnalysis/UCI HAR Dataset/test/subject_test.txt", quote="\"", stringsAsFactors=FALSE)

## Combine the subject datasets
subjects <-rbind(subject_test, subject_train) 
colnames(subjects)<-"Subject" 

## GET THE RECORDED DATA VALUES
## Get the data
values_train <- read.table("C:/Users/Gary/OneDrive/Data Science/3. Getting and Cleaning Data/Project/Wearable/GitProject/RunAnalysis/UCI HAR Dataset/train/X_train.txt", quote="\"", stringsAsFactors=FALSE)
values_test <- read.table("C:/Users/Gary/OneDrive/Data Science/3. Getting and Cleaning Data/Project/Wearable/GitProject/RunAnalysis/UCI HAR Dataset/test/X_test.txt", quote="\"", stringsAsFactors=FALSE)

## Merge the two datasets
values <-rbind(values_test,values_train)

## GET THE FEATURES
## Get the feature data
features <- read.table("C:/Users/Gary/OneDrive/Data Science/3. Getting and Cleaning Data/Project/Wearable/GitProject/RunAnalysis/UCI HAR Dataset/features.txt", quote="\"", stringsAsFactors=FALSE)
feature_names <- features[,2] 
## Add the feature names to the data
colnames(values) <- feature_names

##GET THE ACTIVITIES
## Get the activity codes
activity_code_test <- read.table("C:/Users/Gary/OneDrive/Data Science/3. Getting and Cleaning Data/Project/Wearable/GitProject/RunAnalysis/UCI HAR Dataset/test/y_test.txt", quote="\"", stringsAsFactors=FALSE)
activity_code_train <- read.table("C:/Users/Gary/OneDrive/Data Science/3. Getting and Cleaning Data/Project/Wearable/GitProject/RunAnalysis/UCI HAR Dataset/train/y_train.txt", quote="\"", stringsAsFactors=FALSE)
## Merge the two activity codes datasets
activity_codes <- rbind(activity_code_test, activity_code_train)

## Get Activity labels and merge with the codes
activity_labels <- read.table("C:/Users/Gary/OneDrive/Data Science/3. Getting and Cleaning Data/Project/Wearable/GitProject/RunAnalysis/UCI HAR Dataset/activity_labels.txt", quote="\"", stringsAsFactors=FALSE)
labels <- merge(activity_codes, activity_labels, by=1)[,2]


## SUBSET BY MEAN AND STD COLUMNS
values <-values[,grepl("mean|std", feature_names)]

## MERGE ALL 3 DATASETS
data <- cbind(subjects, labels, values)

##names(values_train)<-feature_names 
##names(values_test)<-feature_names 
write.table(data, file="wearableData.txt")

## WITH COMBINED DATA, GET THE MEAN OF ALL VARIABLES BY SUBJECT
data = melt(data, id.var = c("Subject", "labels")) 
data = dcast(data , Subject + labels ~ variable, mean) 


## SAVE THE DATA AS TXT FILE
write.table(data, file="summarisedWearableData.txt")
data
