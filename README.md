#Human Activity Recognition Using Smartphones Averaged Dataset 
Version 1.0

##General information
This dataset (further referred to as Averaged Dataset) is based on Human Activity Recognition Using Smartphones Dataset v.1.0 [1], further referred to as the Source Dataset.
It contains averaged values for each feature from the Source Dataset referencing measurements of the mean and standard deviation for each record.
The idea behind averaging values is to obtain for each subject (performing activities) and each performed activity average values of the mean and standard deviation of various features of that activity.

Total number of features stored for each record in the Source Dataset is 561, all the feature names are enlisted in "features.txt" file distributed with the Source Dataset archive available in [2]. Total number of relevant features is 79, they all have either "mean" or "std" substring in their names.

##The Averaged Dataset contains the following files:
* 'tidydataset.txt' - the Averaged Dataset itself.
* 'run_analysis.R' - the R script performing transformation of the Source Dataset to the Averaged Dataset.
* 'README.md' - notes on usage of the R script
* 'CodeBook.md' - the data dictionary, the variables used in R script, the notes on transformation of the Source Dataset to the Averaged Dataset.
* 'UsedFeatures.md' - the description of all the 79 features selected out of 561 features available in the Source Dataset.

##How to prepare the Averaged Dataset
* download and unzip the file [2] into a folder X
* download file run_analysis.R and place it into the folder X 
* run R Studio
* File->Change Folder... and select folder X
* File->Open Script... and select run_analysis.R
* Edit->Run All
* tidydataset.txt should appear in the folder X

##References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[2] http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip
