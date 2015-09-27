# run_analysis merges different data sets to create one tidy, workable data set.

cat ("Welcome, this script will merge, tidy and subset the UCI HAR Dataset.
The libraries data.table and dplyr will be loaded.

     Press [enter] to continue and [esc] to abort")
line <- readline()

# Load all needed libraries

if (require(data.table) && require(dplyr)) {
  cat("libraries loaded
      ")
} else if (require(data.table)) {
  install.packages("dplyr")
  if (require(data.table) && require(dplyr)) {
    cat("libraries loaded
        ")
  }
} else if (require(dplyr)) {
  install.packages("data.table")
    if (require(data.table) && require(dplyr)) {
      cat("libraries loaded
          ")
  }
}

cat ("The script will now check if the required data is present and download it if needed.
The author of the script has no affiliation with the source of the material, downloading will be at your own risk.
Abort and place the material in your working directory manually to avert any download.

     Press [enter] to continue and [esc] to abort")
line <- readline()

# Check if the data is present, download if needed

if (dir.exists("UCI HAR Dataset")) {
  cat("data found
      ")
} else if (file.exists("getdata_projectfiles_UCI HAR Dataset.zip")) {
  unzip("getdata_projectfiles_UCI HAR Dataset.zip")
  cat("data extracted
      ")
} else {
  temp_file <- tempfile(tmpdir = getwd())
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp_file)
  unzip(temp_file)
  unlink(temp_file)
  cat("data downloaded
      ")
}

# load the data, label the variables and merge the sets to create one data set

test <- read.table("UCI HAR Dataset/test/X_test.txt")
train <- read.table("UCI HAR Dataset/train/X_train.txt")
data <- rbind.data.frame(test, train)
var_name <- read.table("UCI HAR Dataset/features.txt")
var_name <- gsub("[()]", "", var_name$V2)
names(data) <- make.names(var_name, unique = TRUE)

test_act <- read.table("UCI HAR Dataset/test/y_test.txt")
train_act <- read.table("UCI HAR Dataset/train/y_train.txt")
activity <- rbind.data.frame(test_act, train_act)
names(activity) <- "Activity"

test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject <- rbind.data.frame(test_subject, train_subject)
names(subject) <- "Subject"

data <- cbind.data.frame(data, activity, subject)

# Extract only the measurements on the mean and standard deviation for each measurement. 

subset_data <- select(data, contains("mean", ignore.case = TRUE), contains("std"), Activity, Subject)

# Uses descriptive activity names to name the activities in the data set

act_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
act_labels$V2 <- gsub("_", " ", act_labels$V2, fixed = TRUE)
subset_data$Activity <- act_labels[match(subset_data$Activity, act_labels$V1), 'V2']
                         
# Appropriately label the data set with descriptive variable names. 

tidy_names <- names(subset_data)
tidy_names <- gsub("mean", "Mean", tidy_names, ignore.case = FALSE)
tidy_names <- gsub("std", "StandardDeviation", tidy_names, ignore.case = FALSE)
tidy_names <- gsub("gravity", "Gravity", tidy_names, ignore.case = FALSE)
tidy_names <- gsub(".", "", tidy_names, fixed = TRUE)
tidy_names <- gsub("Acc", "Accelerometer", tidy_names, fixed = TRUE)
tidy_names <- gsub("Gyro", "Gyroscope", tidy_names)
tidy_names <- gsub("Mag", "Magnitude", tidy_names)
tidy_names <- gsub("Freq", "Frequency", tidy_names)
tidy_names <- gsub("angle", "Angle", tidy_names)
tidy_names <- gsub("tB", "TimeB", tidy_names, ignore.case = FALSE)
tidy_names <- gsub("tG", "TimeG", tidy_names, ignore.case = FALSE)
tidy_names <- gsub("fB", "FrequencyB", tidy_names, ignore.case = FALSE)
tidy_names <- gsub("fG", "FrequencyG", tidy_names, ignore.case = FALSE)
tidy_names <- gsub("BodyBody", "Body", tidy_names, ignore.case = FALSE)
names(subset_data) <- tidy_names

# From that, create a second, independent tidy data set with the average of each variable for each activity and each subject.

DT <- data.table(subset_data)
mean <- DT[, lapply(.SD, mean), by=list(Subject = DT$Subject, Activity = DT$Activity)]
independent_data_who_dont_need_no_man <- arrange(mean, mean$Subject, mean$Activity)

write.table(independent_data_who_dont_need_no_man, "tidy.dataset.mean.txt", row.name = FALSE, sep = "\t")

wd <- getwd()

if (file.exists("tidy.dataset.mean.txt")) {
  cat ('The data set has been created.
  You will find the created data set in:
  ',
  wd,'/tidy.dataset.mean.txt', sep = "")
} else {
  cat ('ERROR! File was not created.
  
  Try running the script again.')
}