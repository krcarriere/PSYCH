
# You should remove all of the _ in the code - they are there simply to help
# visualize where we want you to edit.

# Let's take our data, Selfies, and reassign it.
# We will reassign it as the name of our data, Selfies, and then
# let us our mutate() function and create a new variable called WeightDiff
# To do that, we'll set our new variable WeightDiff equal to 
# the subtraction of SelfieWeightAv minus AlloWeightAv  
# Repeat this process, but create a second new variable called AttractDiff,
# and make it the subtraction of SelfieAttractAv minus AlloAttractAv 

Selfies  <-
  Selfies  |>
  mutate(
    WeightDiff = SelfieWeightAv - AlloWeightAv,
    AttractDiff = SelfieAttractAv - AlloAttractAv
  )
    
    
    # Also - note how we coded this - a LOT of enters. Remember, coding is about reading.
    # And the best way to read is straight down.
    # This whole thing could be coded on a single line - but why?? 
    
# Finally - did you make sure that all of the capitalizations were maintained?