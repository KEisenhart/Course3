#############Coursera Course Project Script run_analysis.R #######
#This script has 4 functions:
#The main function is run_analysis which invokes:
#	processTestData
#	processTrainingData
#	get_mean_and_std
#Descriptions and comments are provided for each function 
#	as follows.
#Invoke as run_analysis(), there is nothing returned to caller
#	unless a file cannot be found in the working directory.
#PLEASE refer to README.MD and CodeBook.MD 
#	before analysing this script.
##################################################################	
#############Process Test data ###################################
#Add appropriate labels to columns
#Fix Test Activity names 
#Process Subjects 
#Process Test variables
#Merge together all test related data into 1 dataframe
#Return to caller the dataframe mtstdata
##
processTestData <- function(features_all) { 
	#Open the list of all the test activities
	if (!file.exists("y_test.txt"))
        stop( "Input file y_test.txt is missing" )
	y_test<-read.table("y_test.txt")
	#Replace the column name
	colnames(y_test)<-"activities"
	#Use real activity values instead of integers
	y_test$activities<-revalue(as.character(y_test$activities),
		c("1"="WALKING","2"="WALKING_UPSTAIRS",
                  "3"="WALKING_DOWNSTAIRS", "4" = "SITTING",
                  "5" = "STANDING", "6" = "LAYING"))
	#Step 3 complete - use descriptive activity names
	#
	#Add a temporary common column for later merging
	#Will be removed from final merged dataframe
	y_test$observationnum<-1:nrow(y_test)	
	#	
	#Get list of subjects who did the activities
	if (!file.exists("subject_test.txt"))
        stop( "Input file subject_test.txt is missing" )
	subject_test<-read.table("subject_test.txt")
	#Replace the column name
	colnames(subject_test)<-"subjectids"
	#Add the common column for later merging
	subject_test$observationnum<-1:nrow(subject_test)	
	#			  
	#Now process x_test
	if (!file.exists("X_test.txt"))
		stop( "Input file X_test.txt is missing" )
	x_test<-read.table("X_test.txt")
	#Put in correct column names
	names(x_test)<-features_all
	#Add the common column for later merging
	x_test$observationnum<-1:nrow(x_test)	
	#Merge the test files by the common column "observationnum"
	merged<-merge(x=subject_test,y=y_test,
		by.x="observationnum",by.y="observationnum")
	mtstdata<-merge(x=merged,y=x_test,
		by.x="observationnum",by.y="observationnum")
	#Merged file is now 2947 rows by 564 columns -
	#561 columns of data plus 3 more for Observation Number, 
	#	Subject ID and Activity
mtstdata
}

#############Process Training data ###############################
#Add appropriate labels to columns
#Fix Training Activity names 
#Process Subjects 
#Process Training variables
#Merge together all training related data into 1 dataframe
#Return to caller the dataframe mtrndata
##
processTrainingData <- function(features_all) { 
	#Open the list of all the activities
	if (!file.exists("y_train.txt"))
        stop( "Input file y_train.txt is missing" )	
	y_train<-read.table("y_train.txt")
	#Replace the column name
	colnames(y_train)<-"activities"
	#Use real activity values instead of integers
	y_train$activities<-revalue(as.character(y_train$activities),
		c("1"="WALKING","2"="WALKING_UPSTAIRS",
                  "3"="WALKING_DOWNSTAIRS", "4" = "SITTING",
                  "5" = "STANDING", "6" = "LAYING"))
	#Step 3 complete - use descriptive activity names
	#
	#Add a temporary common column for later merging
	#Will be removed from final merged dataframe
	y_train$observationnum<-1:nrow(y_train)	
	#	
	#Get list of subjects 
	if (!file.exists("subject_train.txt"))
        stop( "Input file subject_train.txt is missing" )	
	subject_train<-read.table("subject_train.txt")
	#Replace the column header
	colnames(subject_train)<-"subjectids"
	#Add a the common column for later merging
	subject_train$observationnum<-1:nrow(subject_train)	
	#
	#Now process x_train
	if (!file.exists("X_train.txt"))
		stop( "Input file X_train.txt is missing" )
	x_train<-read.table("X_train.txt")
	#Put in correct column names
	names(x_train)<-features_all
	#Add the common column for later merging
	x_train$observationnum<-1:nrow(x_train)	
	#Merge the train files by the common column "observationnum"
	merged<-merge(x=subject_train,y=y_train,
		by.x="observationnum",by.y="observationnum")
	mtrndata<-merge(x=merged,y=x_train,
		by.x="observationnum",by.y="observationnum")
	#Merged file is now 7352 rows by 564 columns -
	#One column for Observation Number, another for Activities 
	#	and another for Subject ID + 561 of data
mtrndata
}

#############get_mean_and_std ####################################
#grep out all mean and standard dev variables from the merged data frame
#Create a new dataframe to hold subject ids, activities and the mean 
#	and std variables
#Move over the columns from mdata
#Return to caller the dataframe result.frame.final
##
get_mean_and_std<- function(mdata){	
	#Pull out just the mean and std columns, get the 
	# 	number of occurrences of each
	themean<-grep("mean",names(mdata),value=TRUE)
	m<-length(themean)
	std<-grep("std",names(mdata),value=TRUE)
	s<-length(std)
	#Create the dataframe to hold the std, the mean columns,
	#	plus subject and activities
	tcol=length(std)+length(themean)+2
	trow=nrow(mdata) 
	result.frame.final = 
		as.data.frame(matrix(ncol=tcol, nrow=trow))
	#Move over the subject and activity columns
	names(result.frame.final)[1]<-"subjectids"
	result.frame.final[1]<-mdata$subjectids
	names(result.frame.final)[2]<-"activities"
	result.frame.final[2]<-mdata$activities
	#Pull out the std column names and associated data,
	#       and move to new dataframe
	start<-3
	for (i in 1:length(std)) {
		names(result.frame.final)[start]<-std[i]
		#Move the data over
		result.frame.final[start]<-mdata[std[i]]
		start<-start+1
	}
	#Repeat for the mean variables
	index<-s+1+2
	for (i in 1:length(themean)) {
		names(result.frame.final)[index]<-themean[i]
		result.frame.final[index]<-mdata[themean[i]]
		index<-index+1
	}
result.frame.final
}

#############run_analysis ########################################
#Tidy up all variable names as listed in the features.txt file 
#Merge the test and training data.
#Extract the mean and standard deviation variables from the merged 
#	data frame.
#Reshape and cast the final data structure to tidy it up. 
#	Cast with mean function
#Write the data structure, dcasted to disk file dcasted.txt.
#
####    Refer to README.MD and CodeBook.MD for additional    #####
####    information on implementation, variable data         #####
####    dictionary, design assumptions, etc.                 #####
##                                                              ##
run_analysis<- function() { 
	#Load the special libraries for this script
	library(plyr)  #need for revalue function
	library(reshape2) #for dcast and melt functions	
	#Label the data set so it's usable, remove problem characters
	if (!file.exists("features.txt"))
        stop( "Input file features.txt is missing" )
	features<-read.table("features.txt")
	features2<-gsub(",","",features$V2)
	features3<-gsub("-","",features2)
	features4<-gsub("\\(","",features3)
	features5<-gsub("\\)","",features4)
	final_features<-tolower(features5)
	#Step 4 complete. Label the data set with descriptive 
	#	variable names
	#Go process the test and training measurements
	merged_test_data <- processTestData(final_features)
	merged_train_data<- processTrainingData(final_features)
	#Merge the test and training data putting the training data at the 
	#	end of the test. mdata is 10299 rows by 564 columns
	mdata<-rbind(merged_test_data,merged_train_data)
	#Remove the temp column used for sorting
	mdata$observationnum<-NULL
	#STEP 1 COMPLETE, mdata is the merged data frame of test and 
	#	training data at 10299 rows by 563 columns
	#Get the standard deviations and means...
	almost_tidy<-get_mean_and_std(mdata)
	#STEP 2 COMPLETE, almost_tidy has just std's and means for 
	#each subject and activity. File is 10299 rows long x 88 columns
	#
	#Complete the project - Create a tidy data set of averages
	#Melt the data to reshape it, make it long.
	dmelt<-melt(almost_tidy,id.vars=c("subjectids","activities"))
	#dmelt is 88,5714 rows x 88 columns
	#Cast the data and apply the mean function to the variables
	dcasted<-dcast(dmelt,subjectids + activities ~ variable, mean)
	#Casted data is now only 180 rows(30 subjects*6 activities) x 88 columns
	#Write table out with no row names
	write.table(dcasted,file="dcasted.txt",row.name=FALSE)
	#Step 5 complete - a tidy data set with the average of each variable  
	#	for each activity and each subject has been written to disk in 
	#	file dcasted.txt 
}
