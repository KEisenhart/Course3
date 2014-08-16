==================================================================
Course Project for Coursera Getting & Cleaning Data class
==================================================================

#Introduction
The Data for this project was taken from the UCI Machine Learning Repository:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
in the form of a downloaded zip file from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Data was downloaded and unzipped for usage on August 5th 2014 @ 14:29:00 CDT

The data provided is a variaty of text files representing two sets of experiments, test and training, which 
captured 30 people doing 6 activities wearing a Samsung Galazy S II smartphone on their waist.

#Tidy Data Effort
The data was not easy to decipher. Eg the six activities were numbered 1 to 6 in files thousands of lines long. 
I assigned real world meanings to the activities, replacing 1-6 with 
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

The features file was really a name list of all 561 signal variables that were captured in both test and training mode.
They had to be mapped to the test and training mode but to make them easier to deal with I removed several 
"funny" characters such as dashes, commas, and left/right parens. To follow the recommendations of our 
instructors, I also made each variable lowercase though to be honest, I would have preferred to leave them mixed
case for ease of reading. But, I didn't. Either way, the naming of the variables is now tidier and easier to search on,
process, etc.

There were 3 files each dealing with test and training. 6 total. This was tedius to review and attempt to correlate. 
I first merged the test subjects file (the participants) with the activities, then this with the 561 signal variables. I
created a temp column called observationnum that was used to be the common column for the merging.

This resulted in a dataframe with 564 columns (1 Subject, 1 Activity,  561 signals, 1 for sorting purposes only) times
2947 rows of data. I repeated this for training and got a merged file of the same number of columns of course, 564 
with 7352 rows of data. Finally, I merged the two doing a row bind with test data "on top" and training at the bottom. 
This resulted in 1 mega file of 10,299 rows x 564 columns. Step 1 of course project accomplished.



