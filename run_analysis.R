# First step for this work is to get packeges for our work

install.packages("dplyr")
library('dplyr')
install.packages("tidyr")
library('tidyr')

# Second step is to download all datas, that we need to work with,
# and take a look on these datas

# Download the list of all features
feature <- read.table('C:/Users/Kcukcu/Desktop/coursera/r/progect/UCI HAR Dataset/features.txt' )
str(feature)
class(feature)


# Download activity labels (Links the class labels with their activity name.)
activity <- read.table('C:/Users/Kcukcu/Desktop/coursera/r/progect/UCI HAR Dataset/activity_labels.txt' )
str(activity)

class(activity)



# Download datas for the test set (activity, subject and set)
activity_test <- read.table('C:/Users/Kcukcu/Desktop/coursera/r/progect/UCI HAR Dataset/test/y_test.txt' )
str(activity_test)
class(activity_test)

subject_test <- read.table('C:/Users/Kcukcu/Desktop/coursera/r/progect/UCI HAR Dataset/test/subject_test.txt' )
str(subject_test)
class(subject_test)

test_set <- read.table('C:/Users/Kcukcu/Desktop/coursera/r/progect/UCI HAR Dataset/test/X_test.txt' )
str(test_set)
class(test_set)

# Download datas for the train set (activity, subject and set)
activity_train <- read.table('C:/Users/Kcukcu/Desktop/coursera/r/progect/UCI HAR Dataset/train/y_train.txt' )
str(activity_train)
class(activity_train)

subject_train <- read.table('C:/Users/Kcukcu/Desktop/coursera/r/progect/UCI HAR Dataset/train/subject_train.txt' )
str(subject_train)
class(subject_train)

train_set <- read.table('C:/Users/Kcukcu/Desktop/coursera/r/progect/UCI HAR Dataset/train/X_train.txt' )
str(train_set)
class(train_set)

# After we download our raw data, we need to clean up them, and merge into one data frame

# Merge all test datas in one data frame and rename columns

names(test_set) <- feature$V2
names(activity_test) <- c("activity")
names(subject_test) <- c("subject")

test_set <- cbind(subject_test,activity_test,test_set)
str(test_set)
class(test_set)

# Merge all train datas in one data frame and rename columns

names(train_set) <- feature$V2
names(activity_train) <- c("activity")
names(subject_train) <- c("subject")

train_set <- cbind(subject_train,activity_train,train_set)
str(train_set)
class(train_set)

# Merges the training and the test sets to create one data set.

merge_set <- bind_rows(train_set, test_set)
str(merge_set)

#Extracts only the measurements on the mean and standard deviation for each measurement.

merge_set_clean <- select(merge_set, subject, activity, contains("mean()"), contains("std()"))
str(merge_set_clean)

#Uses descriptive activity names to name the activities in the data set

merge_set_clean <-
  merge_set_clean %>%
  mutate(activity = activity$V2[activity])
str(merge_set_clean)

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

result_data <- 
  merge_set_clean %>%
  group_by(activity,subject)%>%
  summarise_each(funs(mean))

write.table(result_data, row.name=FALSE)
