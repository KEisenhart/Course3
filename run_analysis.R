#############Coursera Course Project Script run_analysis.R #######
#This script has 3 functions:
#The main function is run_analysis which invokes:
#	processData
#	get_mean_and_std
#Descriptions and comments are provided for each function. 
#Invoke as run_analysis(), there is nothing returned to caller
#	unless a file cannot be found in the working directory.
#PLEASE refer to README.MD and CodeBook.MD 
#	before analysing this script.
##################################################################	
#############ProcesData ##########################################
#Add appropriate labels to columns
#Fix Activity names 
#Process Subjects 
#Process measurement variables
#Merge together all related data into 1 data frame
#Return to caller the data frame merged_data
##
processData <- function(features_all,signal_type="") { 
	thefile<- paste("y_",signal_type,".txt",sep="")
	#Open the list of all the activities
	if (!file.exists(thefile)) {
		message<- paste("Input file",thefile,"doesn't exist")
		stop( message)
	}
	y_file<-read.table(thefile)
	#Replace the column name
	colnames(y_file)<-"activities"
	#Use real activity values instead of integers
	y_file$activities<-revalue(as.character(y_file$activities),
		c("1"="WALKING","2"="WALKING_UPSTAIRS",
                  "3"="WALKING_DOWNSTAIRS", "4" = "SITTING",
                  "5" = "STANDING", "6" = "LAYING"))
	#Step 3 complete - use descriptive activity names
	#
	#Add a temporary common column for later merging
	#Will be removed from final merged data frame
	y_file$observationnum<-1:nrow(y_file)	
	#	
	#Get list of subjects who did the activities
	thefile<-paste("subject_",signal_type,".txt",sep="")
	if (!file.exists(thefile)) {
		message<- paste("Input file",thefile,"doesn't exist")
		stop( message)
	}
	subject_file<-read.table(thefile)
	#Replace the column name
	colnames(subject_file)<-"subjectids"
	#Add the common column for later merging
	subject_file$observationnum<-1:nrow(subject_file)	
	#			  
	#Now process the signal measurements
	thefile<-paste("X_",signal_type,".txt",sep="")
	if (!file.exists(thefile)) {
		message<- paste("Input file",thefile,"doesn't exist")
		stop( message)
	}
	x_file<-read.table(thefile)
	#Put in correct column names
	names(x_file)<-features_all
	#Add the common column for later merging
	x_file$observationnum<-1:nrow(x_file)	
	#Merge the files by the common column "observationnum"
	merged<-merge(x=subject_file,y=y_file,
		by.x="observationnum",by.y="observationnum")
	merged_data<-merge(x=merged,y=x_file,
		by.x="observationnum",by.y="observationnum")
merged_data
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
	#Create the data frame to hold the std, the mean columns,
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
#Write the data structure, dcasted, to disk file dcasted.txt.
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
	merged_test_data <- processData(final_features,"test")
	merged_train_data<- processData(final_features,"train")
	#Merge the test and training data putting the training data at the 
	#	end of the test. 
	mdata<-rbind(merged_test_data,merged_train_data)
	#Remove the temp column used for sorting
	mdata$observationnum<-NULL
	#STEP 1 COMPLETE, mdata is now in its final merged form
	#	
	#Get the standard deviations and means...
	almost_tidy<-get_mean_and_std(mdata)
	#STEP 2 COMPLETE, almost_tidy has just std's and means for 
	#	each subject and activity. 
	#
	#Complete the project - Create a tidy data set of averages
	#Melt the data to reshape it, make it long.
	dmelt<-melt(almost_tidy,id.vars=c("subjectids","activities"))
	#Cast the data and apply the mean function to the variables
	dcasted<-dcast(dmelt,subjectids + activities ~ variable, mean)
	#Write table out with no row names
	write.table(dcasted,file="dcasted.txt",row.name=FALSE)
	#Step 5 complete - a tidy data set with the average of each variable  
	#	for each activity and each subject has been written to disk in 
	#	file dcasted.txt 
}
