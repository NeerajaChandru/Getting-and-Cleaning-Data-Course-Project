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
