# Let's take our data, data_select2, and reassign it.
# We will reassign it as the name of our data, data_select2, and then
# let us mutate() by creating a new variable called NotSetosa
# To do that, we'll set our new variable NotSetosa equal to case_when().
# Inside of case_when(), we will pass a small series of comparisons.
# The first one we've done for you - when Species=="setosa" we want it equal to 0.
# The next two you need to do - we want versicolor and viriginica to be equal to 1.

_nameofdata_  <-
 _nameofdata_  |>
 _function(
   _newvarname_ = case_when(
     Species=="setosa" ~ 0,
     Species=="______" ~ 1,
     Species=="______" ~ 1
     )
 )

   
# Also - note how we coded this - a LOT of enters. Remember, coding is about reading.
# And the best way to read is straight down.
# This whole thing could be coded on a single line - but why?? 