#Human Activity Recognition Using Smartphones Averaged Dataset CodeBook
Version 1.0

##General information on the Averaged Dataset

For each record it is provided:
* An identifier of the subject who carried out the experiment.
* A descriptive activity name performed by the subject.
* values of 79 features, averaging the measurements of performing the particular activity by the particular subject

##Data Dictionary for the Averaged Dataset

* subject       
		2

		subject performing activity

			* 1..30 sequential number of the subject performing activity
			
* activity      
		18

		activity performed
		
			* WALKING 
			* WALKING_UPSTAIRS
			* WALKING_DOWNSTAIRS
			* SITTING
			* STANDING
			* LAYING
			
* feature      
 		13

		one out of 79 features values (please refer to the file "UsedFeatures.md" for the details)

			* -X.XXXXXXe-XX X.XXXXXXe-XX a mean of a feature value. Allowed values [-1.0, 1.0]

##Variables used in R script 'run_analysis.R'
* DFAct - a data frame to store correspondence between sequential numbers and activity labels.
* Features - a data frame to store 561 feature labels.
* DFSubj - a data frame to store sequential numbers of subjects performed activity in several experiments (the same subject can perform a particular activity several times). Test part.
* DFY - a data frame to store sequential numbers of activities performed in experiments (the same activity can appear several times). Test part.
* DFX - a data frame to store values of 561 feature vector for one experiment. Test part.
* DFSubjTrain - a data frame to store sequential numbers of subjects performed activity in several experiments (the same subject can perform a particular activity several times). Train part.
* DFYTrain - a data frame to store sequential numbers of activities performed in experiments (the same activity can appear several times). Train part.
* DFXTrain - a data frame to store values of 561 feature vector for one experiment. Train part.
* features - a factor vector to store relevant feature labels(related to mean and standard deviation)
* DFActY - a data frame to store correspondence between codes from DFY and activity labels from DFAct. 
* DFActYTrain - a data frame to store correspondence between codes from DFYTrain and activity labels from DFAct.
* PreTidyDF - a data frame to store the full record of each experiment: subject, activity labels and 79 feature vector values.
* molten - a data frame where subject and activity label are selected as rows, 79 feature vector values - as columns, values of 79 feature vector for each experiment - as values
* casted - a (tidy) data frame where subject and activity are selected as rows and 79 feature vector values - as columns, means of 79 feature vector for each subject and each activity - as values.
