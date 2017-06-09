---
title: "Human Actvity Recognition Using Smartphones Dataset analysis"
author: "Mike Duncan"
date: "6/9/17"
output: filed called Finished.txt.  Tidy Data set which has the average of each variable that contains mean and standard deviation for each activity and each subject
---

## Project Description
Short description of the project

###Raw data
Data was from the "Human Actvity Recognition Using Smartphones Dataset; Version 1.0"

Collected by 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory


###Cleaning of the data
Proccessed the data with the run_analysis program.  Link to the [README](https://github.com/mikeblakeduncan/run_analysis/blob/master/README.md)

##CodeBook
Columns have titles in the following format: activityvolunteer#.  
    For example, "walking1" contains for the walking measurements from volunteer 1
    And "sitting30" contains for the sitting measurements from volunteer 30
Rows contain the mean of the mean and the standard deviation of the sensor signals

Each record contains:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.