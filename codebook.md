#Selection of Columns
-the file feature.txt was read in to give a two column dataset
-column names "colindex" and "names" were giben
-all occurences of "()" were removed -because col names like "abd-mean()-x" produced problems
-all occurences of "-" were removed - for the same reasons
-all column were selected which contain the string "mean" or "std"
- resulting in 79 rows containing std or mean information

#Generation of Main data set
-the test data was combined to get the activites by join rows 
-the train data was combined to get the activites by join rows

- train and test data were combined per row
#column selection
-the columns were selected using the colindex attribute from the selected feature set

#Grouping
-activity numbers were replaced with activity names. 
#Summarizing