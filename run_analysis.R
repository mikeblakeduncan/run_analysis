run_analysis <- function() {
        ## sets working directory
        train_fold <- "C:/Users/mikeb/Coursera/Data Science (Coursera)/Clean Data/Week 4/UCI HAR Dataset/train"
        test_fold <- "C:/Users/mikeb/Coursera/Data Science (Coursera)/Clean Data/Week 4/UCI HAR Dataset/test"
        head_fold <- "C:/Users/mikeb/Coursera/Data Science (Coursera)/Clean Data/Week 4/UCI HAR Dataset/"

        
        ## Reads all the test & train files, then binds into a single file
        ## Also reads features file, which are the column names
        
        setwd(train_fold)
        train <- read.table("x_train.txt")
        train_activity <- read.table("y_train.txt")
        train_subject <- read.table("subject_train.txt")
        
        setwd(test_fold)
        test <- read.table("x_test.txt")
        test_activity <- read.table("y_test.txt")
        test_subject <- read.table("subject_test.txt")
      
        setwd(head_fold)
        features <- read.table("features.txt")
          
        TrainTest <- rbind(train,test)
        TTactivity <- rbind(train_activity, test_activity)
        TTsubject <- rbind(train_subject, test_subject)
        sort(as.numeric(TTsubject$X1))
        
        ## adds a new column with Activity & Volunteer 
        TT_ALL <- cbind(TrainTest,TTactivity)
        TT_ALL <- cbind(TT_ALL,TTsubject)
        
        ## adds column names
        colnames(TT_ALL) <- features$V2
        colnames(TT_ALL)[562] <- "Activity"
        colnames(TT_ALL)[563] <- "Volunteer"              
        
        ## finds columns with mean & sd
        meanCols <- grep("mean",names(TT_ALL))
        stdCols <- grep("std",names(TT_ALL))
        Cols <- c(meanCols,stdCols)
        sort(Cols)
        TT_SLIM <- TT_ALL[,c(Cols,562,563)]

        ## split the table into sub-tables by activity & volunteer; take mean
        setwd(head_fold)
        s <- split(TT_SLIM, list(TT_SLIM$Activity,TT_SLIM$Volunteer))
        p <- data.frame(lapply(s,colMeans))
        
        names(p) <- gsub("X1\\.","walking",names(p))
        names(p) <- gsub("X2\\.","walkingupstairs",names(p))
        names(p) <- gsub("X3\\.","walkingdownstairs",names(p))
        names(p) <- gsub("X4\\.","sitting",names(p))
        names(p) <- gsub("X5\\.","standing",names(p))
        names(p) <- gsub("X6\\.","laying",names(p))
        
        write.table(p,file = "Finished.txt", row.name=FALSE)
        
}

## write.table(lapply(s,colMeans),file = "Finished.csv")

## split the table into sub-tables by activity & volunteer; take mean
## setwd(head_fold)
## s <- split(TT_SLIM, list(TT_SLIM$Activity,TT_SLIM$Volunteer))
## p <- lapply(s,colMeans)
## write.table(p,file = "Finished.csv")


## add descriptive names to the activities
## TT_SLIM$Activity <- gsub("1","walking",TT_SLIM$Activity)
## TT_SLIM$Activity <- gsub("2","walkingupstairs",TT_SLIM$Activity)
## TT_SLIM$Activity <- gsub("3","walkingdownstairs",TT_SLIM$Activity)
## TT_SLIM$Activity <- gsub("4","sitting",TT_SLIM$Activity)
## TT_SLIM$Activity <- gsub("5","standing",TT_SLIM$Activity)
## TT_SLIM$Activity <- gsub("6","laying",TT_SLIM$Activity)
## lapply(s,colMeans)

## write answer to folder
## setwd(train_fold)
## write.table(s,"Finished.xlsx")
## sort(TTsubject$V1)


## data <- read.table("Finished.csv", header = TRUE)
## View(data)

