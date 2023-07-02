# Fix the following script.
# Notice the order and memorize it. 
# Take our dataset (df) , and then
# group it by our explanatory variable (Condition), and then
# Summarise this dataset by
# Creating a new variable in this summary dataset called Mean
# Mean takes the mean of our Response variable, and ignores NA.
# Repeat for standard deviation.

# When you think it is a complete, save the script. The name of the script
# above will go from red to black. That is how you know you've saved it.
# You can use ctrl+S to save, or click the floppy disk above.

sum_intellect <- 
  NameOfDataSet |>  #Change this to df
  group_by(GroupingVariable) |>  #Change this to Condition
  summarise(
    Mean = mean(ResponseVariable, na.rm=TRUE), #Change this to Intellect_Rating
    SD = sd(ResponseVariable, na.rm=TRUE) #Change this to Intellect_Rating
  )

# If you were to type your new dataset into your console, sum_data,
# You will get an output like this:

#  A tibble: 2 × 3
#  Condition  Mean    SD
#  <chr>     <dbl> <dbl>
#1 Audio      5.63  1.61
#2 Text       3.65  1.91