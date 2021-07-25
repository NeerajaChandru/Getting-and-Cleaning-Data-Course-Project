UCI-Human Activity Recognition Using Smartphones Data Set 

Source: Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
    DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy.
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
    Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
    activityrecognition '@' smartlab.ws

This dataset was obtained from the experiments conducted by the above mentioned team. The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using the built in
accelerometer and gyroscope 3- axial raw signals were measured and various features were obtained from it upon processing.(The feature list can be found in the file 'CodeBook.md.txt')
30% and 70% of the volunteers were randomly assigned to the groups 'training' and 'test' respectively.

Each row represents one record if the document 'tidy data.txt' is opened with Notepad++ .
Each record includes the following:
====================================
- Its activity label. 
- An identifier of the subject who carried out the experiment.
- The average of the mean and standard deviation of the time and frequency domain signals. 

The dataset includes the following files:
=========================================
- README.md
- CodeBook.md : Includes the details about the variables of each record
- run_analysis.R : The R script to obtain tidy data from the original dataset
- tidy data.txt : The tidy data set containing the average of the time and frequency domain variables for each activity and each subject.

Code explanation
====================
R 4.1.0 , RStudio 1.4.1717
Packages used : dplyr 1.0.7, car 3.0-11, stringr 1.4.0

1. Read the 'Features.txt' file into Rstudio using read.table function and save it as a character vector called 'Features'.
2. To import the training dataset and assign suitable column names, read the 'X_train.txt' file into Rstudio using read.table and input the character vector 'Features' to the col.names argument.
3. Using grepl select the columns with names containing the strings 'mean' or 'std'. 
4. Use the column identifiers obtained in step 3 to subset the training dataset to obtain only the mean and standard deviation measurements for all the features. 
5. The columns containing the mean frequency data are also included in the data frame after execution of step 3 as they contain the string 'mean' in the column name. Since we do not 
   require this measurement we remove it using the command - contains('meanFreq').
6. Read the files 'y_train' and 'subject_train.txt' into Rstudio as separate tables and label them as 'Activity' and 'SubjectID' respectively.
7. Using cbind join the data tables obtained in step 5 and 6 and store the combined datatable as 'training_group'.
8. Repeat steps 2-7 using the files 'X_test.txt','y_test.txt' and 'subject_test.txt' to obtain the test dataset('test_group') containing the activity name, subject ID and the mean and 
   standard deviation measurements for all the features.
8. Combine the data from the test and training groups row wise and assign it to the variable 'all_data'.
9. Arrange the dataset activity wise (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,SITTING, STANDING, LAYING) and then subject wise (1-30)
10. Using the aggregate command calculate the average of the mean and standard deviation measurements subject wise and activity wise. Store the resulting data set in the variable 'tidy_data'
11. Assign the activity names as per the number in the following manner : 
    1-WALKING
    2-WALKING_UP
    3-WALKING_DOWN
    4-SITTING
    5-STANDING
    6-LAYING
12. Reorder the columns such that the columns in the data frame are in the following order : Activity, SubjectID, average of the mean and std of each feature 
13. Save the tidy datatable as 'tidy data.txt'.

