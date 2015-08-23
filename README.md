This work have to teach us how to get and clean data from different sources. First step for this work is 
to get packeges (diplyr and tidyr).
Second step is to download all datas, that we need to work with,
and take a look on these datas. I download the list of all features (called feature), activity labels 
(Links the class labels with their activity name, called activitity, all datas for the test set (activity, subject and set) and
for the train set (activity, subject and set) - called test_set, train_set ect.
After downloading this raw data, I look at it, to make sure, that they download correct.
Next, I cleaned up them, and merge into one data frame in several steps:
1) I renamed columns : for the data frame test_activity and train_activity into activity
                       for the data frame test_subject and train_subject inro subject
                       for test_set and train_set i get names from the data frame 'features'
2) Merge all datas with test set into one data frame by joining 3 objects by columns
3) I do the same this the yrain set
4) Next I merge this two data frames in one by rows, and call it 'merge_set'
After that, I extracted only the measurements on the mean and standard deviation for each measurement, by 
functions select and contains.
After that I use mutate function to make activity colomn of new data frame, wich was integer from 1 to 7, into caracter 
values from data frame activity. I called this data frame merge_set_clean.
From merge_set_clean I create new data frame, called result_data, where I groupped my datas by activity and subject, 
and find the average of each variable by this group, by function summarize_each.
