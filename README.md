# Getting-and-Cleaning-Data-Course-Project

This is the course project for the Coursera Getting and Cleaning Data course. The R script, run_analysis. R, does the following:

1. Loads both the Activity and Features information
2. Loads both the Test and Training datasets, and keeps only specified columns with means or standard deviation present
3. Loads the Subject and Activity data for each of the datasets, and then proceeds to merget the columns together
4. Merges the Test and Training dataset
5. Converts both Subjecet and Activity columns into factors
6. Finally, creates a tidy dataset consisting of the average of each variable for each Subject and Activity

The end result is shown in the file tidy_data.txt
