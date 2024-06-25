
# You should remove all of the _ in the code - they are there simply to help
# visualize where we want you to edit.

# We're going to create a new dataset call sumdata.kurtosis.
# Let's take our data, memory, and then
# Let's group_by() the variable that represents all 3 conditions as a single factor, and then
# let use our summarise() function and
# create a new variable called kurtPSY
# To do that, we'll set our new variable kurtPSY equal to 
# psych::kurtosi(_dependentvariable_) (There's only one in our dataset) (Yes, it is spelt without the last s).
# Create a second variable called kurtMEM
# and make it equal to moments::kurtosis(_dependentvariable_) (This one has the last s).

sumdata.kurtosis  <-
  _nameofdata_  |>
  group_by( _whatvariablerepresentsall3conditions_ ) |>
  summarise(
    _newVAR_ = _____::kurtosi(_dependentvariable_),
    _newVAR2_ = ______::kurtosis(_dependentvariable)
  )
    
    
    # Also - note how we coded this - a LOT of enters. Remember, coding is about reading.
    # And the best way to read is straight down.
    # This whole thing could be coded on a single line - but why?? 
    
# Finally - did you make sure that all of the capitalizations were maintained?