==================================================================
Course Project for Coursera Getting & Cleaning Data class
==================================================================

#Introduction
The data for this project was taken from the UCI Machine Learning Repository:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
in the form of a downloaded zip file from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Data was downloaded and unzipped for usage on August 5th 2014 @ 14:29:00 CDT


The data provided is in several text files representing two sets of measurements, test and training, 
which captured 561 movement signals on 30 people doing 6 activities each while wearing a Samsung 
Galazy S II smartphone on their waist. 


See my later detailed discussion on "The 8 Required Input Files".


The data license and acknowledgements - please see the end of this README file.
##Assumptions
    1. The object of this course project was to become comfortable with data manipulation and to produce tidy 
data. It was not to address real world i/o issues - missing files, corrupted files, no-read or write access, 
missing sub folders, etc. I followed the course project instructions to "have a file run_analysis.R in the main 
directory that can be run as long as the Samsung data is in my working directory." I did not attempt to fetch 
the file via their hyperlinks, nor did I utilize or attempt to create any subdirectories. If the files that are required for this script are missing from the directory where run_analysis.R is executed the script stops with an 
appropriate error message, just that simple. 

    2.Data Reduction - we were asked to extract "only the measurements on the mean and standard deviation for 
each measurement". I took this to imply I was to pull out and utilize only those variables that held a mean or 
std value. I extracted 86 such variables from both x and y _test files.  

    3.I did not utilize the 9/test, 9/training signal files as "they are the original sensor readings that the values in x were calculated from" - David Hood Coursera Community TA (Course Project Forum - "David's Course Project FAQ"). The post goes on to say that these files "the original inertial files" are not needed. 

##The 8 Required Input Files

###Test and Training measurements while on the Samsung phone:
    1. X_train.txt: The Training set of measuresments - 561 individual readings.
    2. X_test.txt: The Test set of measuresments - 561 individual readings.
    3. features.txt: The names of the 561 variables in both X_train and Y_test files.
###Test and Training activities while on the phone that were measured:
    4. y_train.txt: The training activities associated with each of the 561 readings.
    5. y_test.txt: The test activities associated with each of the 561 readings.
    6. activity_labels.txt: The english description of the 6 activities the subjects performed.
###Subjects who performed the Test and Training activities:
    7. subject_test.txt: The subjects who performed the test activities.
    8. subject_train.txt: The subjects who performed the training activities.
##The run_analysis.R Script

###Briefly, What does it do?
First, the scripts makes the variable names in the features.txt file more readable (tidy) before applying to the 

data. 
It then processes first test then training signal measurements by:

    a. assigning activities and subject ids to each of the 561 measurements. 
    b. replacing the original V1-V561 column names from the X_test/train files with easier to read (tidy) signal names.     c. merging the activities, the subjects and the variables into one data frame.

It then merges the two data frames (test and training) with an rbind to make one very large data frame to 
satisfy step 1 of the course project. This is called mdata.
 
 
The mdata data frame is the input used to satisfy the next requirement: to extract out any variables referencing 
mean or standard deviation. In addition, the subject ids and activities are extracted and everything (subject 
ids, activities and associated mean or std variables) is moved to yet another data frame called almost_tidy. 


Finally, a melt/casting process is applied to this data in almost_tidy to produce the dcasted.txt file to satisfy 
step 5 of the course project. This file is called dcasted.txt

#Tidy Data Effort
The data was not easy to interpret because not only was it spread across 8 files, but it also had 561 readings 
per subject per activity. The activities were identifieid by numerics rather than english words to describe such 
actions as walking or sitting. 


To address these issues, I started with the variable names of the 561 readings (V1-V561). The features file 
was really a name list of all 561 signal variables that were captured in both test and training. Before I renamed 
V1-V561 with these variable names I edited them a bit to make them easier to deal with.  I removed "funny" 
characters such as dashes, commas, and left/right parens. To follow the recommendations of our instructors, 
I also made each variable lowercase though to be honest, I would have preferred to leave them mixed case for 
ease of reading. But, I didn't. Either way, the naming of the variables is now tidier and easier to search on, 
process, etc.


I assigned real world meanings to the activities, replacing values 1-6 with WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.


To reduce the number of files required I went on a merging effort. I merged all the test data together which 
included the subjects and their activities as they related to the 561 measurements. I utilized a column that I 
called observationnum that was used to be the common column for the merging of the files. This resulted in a 
dataframe with 564 columns (1 for Subject, 1 for Activity,  561 signals, and 1 for observation num) times 
2947 rows. I repeated this for training and got a merged dataframe of the same number of columns of course, 
564 by 7352 rows.

I then concluded my merging effort by doing a row bind with the test data frame "on top" and training at the 
bottom. This resulted in 1 merged dataframe called mdata of 10,299 rows x 564 columns. I then removed the 
temporary column I used for merging, observationnum and this left the merged dataframe at 10,299 x 563 
columns. This addressed step 1 of the course project and provided the tidy dataframe I needed for the next 
part of the assignment - to extract out mean and standard deviation measurements only. 


Data frame mdata was the input to the extraction effort. As I stated in my assumptions, in lieu of specific 
details in the course project, I chose to extract any and all columns of data relating to mean or standard 
deviation. I stored them in a dataframe called almost_tidy and my comments in the run_analysis.R script 
should cover the mechanics of this extraction. Simply put, I moved the subject ids, activities and all columns 
with std or mean in their colnames from mdata and put them in a new data frame called almost_tidy.


The name almost_tidy was chosen because there remained one more major step in the tidy data effort - to 
reshape and recast the data into a more usable, readable form. This was accomplished by first applying the 
melt function to enable me to reshape the data by turning columns into rows (dataframe "dmelt"). This data 
frame is 88,5714 rows x 88 columns after the melting. Very long but narrow. 

#Final task, step 5
I then calculated the mean of each variable for each activity for each subject from the dmelt data frame as per 
the project instructions. I used the plyr function dcast to apply the mean to the melted data and recast the data 
into a much tidier table of 180 rows (30 subjects * 6 activities) x 88 columns. The data is now wide and tidy. 
It was written to disk file "dcasted.txt" with write.table, row.name set to false. It can be read in via read.table, 
header set to TRUE.

## Configuration
The script run_analysis.R was built and run under R v3.1.0, RStudio 98.507. Windows 7, 64 bit. Libraries 
plyr, and reshape2 were needed for the functions revalue,melt and dcast respectively. Package reshape2 was 
compiled under R v3.1.1 and will produce a warning message for older R versions. The warning is merely 
informative and has no effect on operation.  

##Acknowledgements
For more information about this dataset contact: activityrecognition@smartlab.ws
Human Activity Recognition Using Smartphones Dataset
Version 1.0
License:
========
Use of the referenced dataset in this file must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human 

Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 

International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


