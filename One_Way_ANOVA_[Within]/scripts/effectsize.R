# "All pairwise comparisons were significant (ps < .01). 
# When vision understated true rotation, pain-free range of motion was increased,
# and this was a medium-sized effect, p = .006, d = 0.67. 

# Remember that Feedback is a factor of three levels:
# Understated, Accurate, and Overstated.

# Also, the variable that identifies the participant is called rowid.

d_underacc <- 
  ____ |>  # Our dataset is called...?
  # This is reporting the comparison of "Understated" v. "Accurate".
  # Which level, then, do we not want to compare?
  filter(Feedback!="__________") |>  # Specify that level here.
  # Since we have removed a level from our variable Feedback, we need to just re-create the factor.
  mutate(Feedback = factor(Feedback)) |> 
  # Rem
  rm_d(________ ~ ________ | _____, # What are we predicting ~ What is our factor | what identifies the participant.
       adjust=FALSE,
       method="av", # We use "av" here. In paired t-test, we stated that "rm" or "av" were appropriate.
       # "rm" will throw an error on this dataset due to how they have structured their data.
       data=_) # There's nothing to fill in here, remember that data=_ is the last call.
