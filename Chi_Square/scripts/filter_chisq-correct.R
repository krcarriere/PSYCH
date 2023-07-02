# We want to filter our dataset to only look at the participants who made 
# mistakes; that is, participants whose cirCor=="Circled More" .

# After we do that, we want to again select our repCor and condition variables.

# We then want to create a table.

# We then want to run a chisq test on this table, setting correct equal to FALSE.

# Remember, you *MUST* save your script (make the tab black, not red) before typing submit().

chi_results <-
  CheatData |>
  filter(cirCor=="Circled More") |> #Add based on the above
  select(repCor, condition) |>
  table() |>
  chisq_test(correct=FALSE)
# Add a line of code before this hashtag that select()s repCor and condition and then's
  # Add a line of code before this hashtag that creates a table() and then's
  # Add a line of code before this hashtag that runs a chisq_test() setting correct to FALSE.
  
  # And save your work!