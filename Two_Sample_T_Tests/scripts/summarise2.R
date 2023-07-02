# Fix the following script by:

# Take our dataset (df) , and then
# group it by our explanatory variable (Condition), and then
# Summarise this dataset by
# Creating a new variable in this summary dataset called Mean
# Mean takes the mean of our Response variable, and ignores NA.
# Repeat for standard deviation.
# We've added on one more column in our summary dataset - N. 
# N is the number of observations per group. To do so, we want to add up
# How many times our DV is not missing (per group). 

# When you think it is a complete, save the script. The name of the script
# above will go from red to black. That is how you know you've saved it.
# You can use ctrl+S to save, or click the floppy disk above.

# We want to know how the means and standard deviations and Ns of Hire_Rating differed.
sum_hire <- 
  # Take Our dataset and then |>
  # group_by() our grouping variable (condition) and then (|>)
  #we will use that summarise( function 
    Mean = # use the mean() function on our dependent variable, but don't forget to also pass that na.rm=TRUE
    SD = # use the sd() function on our dependent variable, but don't forget to also pass that na.rm=TRUE
    N = sum(!is.na(ResponseVariable)) #Change this to say Hire_Rating
  )

# If you were to type your new dataset into your console, sum_data,
# You will get an output like this:

#  A tibble: 2 × 4
#  Condition  Mean      SD     N
#  <chr>    <dbl>    <dbl> <int>
#  1 Audio      4.71  2.26    21
#  2 Text       2.89  2.05    18