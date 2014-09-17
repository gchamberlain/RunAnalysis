---
title: "Run Analysis CodeBook"
author: "Gary Chamberlain"
date: "Wednesday, September 17, 2014"
output: html_document
---


###**Experimental design and background** 

The data used was collected from accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

and the data was obtained from ...

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Our task was to create a tidy dataset from merging the training and test sets. We had to extract only mean and standard deviation measurements and add in descriptive activity names and the subjects from other data sets. Once achieved, we need to summarise in a second tidy data set the average of each variable for each activity and subject.

The outputs will there be two tidy datasets. The first being the orignal tidy data set and the second the one that is summarised as above.


###**Raw data** 

**Obtained from reading the readme supplied with the data we ascertain the following useful information about the raw data...** 


- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

*Other data files are ignored as not required for this project*

###**Processed data**

**The steps to achive our aims are below...**

1. I loaded the test and train subject data sets
  + and combined them together
2. I loaded the recorded data value data sets for both test and train
  + and combined them together
3. I loaded the feature names (ie: the column names for the various measurements recorded in the data value data sets)
  + I used this for the column headings in the data values data set
4. Working with the activity data I ...
  + Loaded the test and train activity code data sets
  + and merged them
  + Loaded the activity labels
  + Merged this with the codes so we have a lookup
5. Subset the main data from step 2
6. Merge the main data with the subjects and activity labels
7. Output the first tidied data set to txt
8. With that tidy data set (still in memory) I...
 + Melted the data by subject and label
 + Used dcast to get the mean of all vairables by subject and labels
 + output this new tidied summarised data set to txt
