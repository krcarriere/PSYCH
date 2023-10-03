# Fix the following script.
# Notice the order and memorize it. 
# Take our dataset (violence) , and then
# Summarise (summarise() ) this dataset by
# Creating a new variable in this summary dataset called Mean
# Mean takes the mean of our Response variable (C), and ignores NA.
# Repeat for standard deviation.
# I have done the N one for you.
# Finally, we have to create a column called SE, or standard error.
# Standard error is calculated as SD/sqrt(N). 

# When you think it is a complete, save the script. The name of the script
# above will go from red to black. That is how you know you've saved it.
# You can use ctrl+S to save, or click the floppy disk above.

sum_violence <- 
  NameOfDataSet |>  #Change this to violence
  summarise(
    Mean = mean(ResponseVariable, na.rm=TRUE), #Change this to C
    SD = sd(ResponseVariable, na.rm=TRUE), #Change this to C
    N = sum(!is.na(C)), # No changes here
    SE = __ / sqrt(_) # Standard Error is SD / sqrt(N). 
  ) |>
  round(_) # APA style states we should round all values to 2 decimal places.

# If you were to type your new dataset into your console, sum_violence,
# You will get an output like this:

#   Mean   SD   N   SE
# 1 0.11 0.41 127 0.04

