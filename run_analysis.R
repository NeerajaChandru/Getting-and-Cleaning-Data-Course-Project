library(dplyr)
library(car)
library(stringr)
setwd("D:/R programming/Getting and cleaning data/UCI HAR Dataset")
Features<-read.table("features.txt")
Features<-Features[,-1]

Training_set<- read.table("train/X_train.txt",col.names = Features)
keep<-grepl("mean|std",colnames(Training_set))
Training_set<-Training_set[,keep]
Training_set<-Training_set %>% select(-contains("meanFreq"))
Training_activitylabel<-read.table("train/y_train.txt",col.names="Activity")
Training_subjectID<-read.table("train/subject_train.txt",col.names="SubjectID")
Training_group<-cbind(Training_activitylabel,Training_subjectID,Training_set)

Test_set<-read.table("test/X_test.txt",col.names = Features)
keep<-grepl("mean|std",colnames(Test_set))
Test_set<-Test_set[,keep]
Test_set<-Test_set %>% select(-contains("meanFreq"))
Test_activitylabel<-read.table("test/y_test.txt",col.names="Activity")
Test_subjectID<-read.table("test/subject_test.txt",col.names="SubjectID")
Test_group<-cbind(Test_activitylabel,Test_subjectID,Test_set)

All_data<-bind_rows(Training_group,Test_group)
All_data<-arrange(All_data,Activity,SubjectID)
Tidy_data<-aggregate(All_data[, 3:ncol(All_data)], list(All_data$SubjectID,All_data$Activity), mean)
colnames(Tidy_data)[1:2]<-c("SubjectID","Activity")
Tidy_data$Activity<-recode(Tidy_data$Activity,"'1'='WALKING';'2'='WALKING_UP';'3'='WALKING_DOWN';'4'='SITTING';'5'='STANDING';'6'='LAYING'")
order<-c(2,1,3:ncol(Tidy_data))
Tidy_data<-Tidy_data[,order]
write.table(Tidy_data,file="D:/R programming/Getting and cleaning data/tidy data.txt", append = FALSE, sep = "\t",
            row.names = FALSE, col.names = TRUE)
