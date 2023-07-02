# Fix the following script.
# Notice the order and memorize it. 
# Take our dataset (df) , and then
# group it by our explanatory variable (condition), and then
# Summarise this dataset by
# Creating a new variable in this summary dataset called Mean
# Mean takes the mean of our Response variable, and ignores NA.
# Repeat for standard deviation.
# I have done the N one for you.
# Finally, we have to create a column called SE, or standard error.
# Standard error is calculated as SD/sqrt(N). 

# When you think it is a complete, save the script. The name of the script
# above will go from red to black. That is how you know you've saved it.
# You can use ctrl+S to save, or click the floppy disk above.

sum_moral <- 
  NameOfDataSet |>  #Change this to concealed
  group_by(GroupingVariable) |>  #Change this to condition
  summarise(
    Mean = mean(ResponseVariable, na.rm=TRUE), #Change this to moral
    SD = sd(ResponseVariable, na.rm=TRUE) #Change this to moral
    N = sum(!is.na(moral)),
    SE = __ / sqrt(_)
  )

# If you were to type your new dataset into your console, sum_data,
# You will get an output like this:

# A tibble: 2 × 5
#  condition    Mean   SD     N     SE
#    <chr>     <dbl> <dbl> <int>  <dbl>
#  1 Conceal    1.74  1.09   224 0.0731
#  2 Disclose   3.49  1.40   215 0.0958