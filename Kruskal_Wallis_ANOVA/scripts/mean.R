# "Participants in the V-ominous treatment rated sharks significantly more 
# negatively (M = 5.07) than those in the V-uplifting (M = 4.33; Dunn’s Z = 2.993,
# Bonferroni-adjusted p = 0.042) and V-silence treatments (M = 4.43; Z = 3.023, p = 0.038)."

vidmeans <-
  ____ |>  # What is the name of our dataset?
  # To make this cleaner, let's filter our data first.
  # What variable in our dataset represents whether or not they were in the Audio or Visual condition?
  # Once we identified that variable, do we want to filter only for those in the Audio condition
  # or those in the Video condition?
  filter(___ = "____" ) |> 
  # Now, we want to group_by() something. There are two options here, and either should work.
  group_by(_____) |>
  summarise(
    # Finally, what do we want a mean of? 
    mean = mean(______, na.rm=TRUE)  
  )