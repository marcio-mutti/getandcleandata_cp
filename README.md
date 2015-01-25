# getandcleandata_cp
Course project for Coursera Class Getting and Cleaning Data

**This manual should guide you through the code I created.**
```R
unzip("UCI_Dataset.zip")
setwd("UCI HAR Dataset")
```
First of all, unpack the data and enter its directory.
```R
x_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
subjects_train<-read.table("train/subject_train.txt")
nomes<-read.table("features.txt")
x_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
subjects_test<-read.table("test/subject_test.txt")
labels<-read.table("activity_labels.txt")
```
Then, proceding to importing the data into R data.frames.