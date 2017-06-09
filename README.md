## Overview
The program is called run_analysis and it takes the experiment data from 30 volunteers, who performed 6 activites wearing a Samsung Galaxy SII smart phone.  The output is a tidy set which has the average of each variable for each activity and each subject.

## 'run_analysis' Explanation

The program does the following:

1. Sets the working directory locations (not needed, but helpful to save space/time)
2. Reads the following files and binds them togehter in one table called:

    Names of files
    "x_train.txt"         - measurement data for the training participants
    "y_train.txt"         - identifies the activity # for the above training data
    "subject_train.txt"   - identifies the volunteer # for the above training data
    "x_test.txt"          - measurement data for the training participants
    "y_test.txt"          - identifies the activity # for the above test data
    "subject_test.txt"    - identifies the volunteer # for the above test data
    "features.txt"        - identifies the column names
    
    How all the tables files fit together:
    bind the rows for (1) x_train & x_test, (2) y_train & y_test, (3) sujbect_train & subject_test
    bind the columns for the above files, then add the column names
    also adds columns for the activity type and the volunteer #
    
3. Identifies the column names that have mean or standard deviation in the title
4. Create a new table, with only data from #3 above
5. Split the table by activity and volunteer, applies to mean of the columns to each
6. Re-labels the column, to include the activity name
7. Writes a text file to the desktop

## Why the final output is tidydata

1. Each row contians one type of variable
2. Each column contains one activity and one volunteer
    
    
    
    
    
