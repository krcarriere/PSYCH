# For histograms, the geom_ we want to add to the ggplot
# is usefully called geom_histogram() .
# Notice how the aes() in ggplot has changed to x= .
# sample = was a very specific case for geom_qq().

# Step 1: Practice the same steps - rename the dataset to Sharks.
# Step 2: Make your x axis equal PositiveRatings
# Step 3: add the geom_ geom_histogram()
# Step 4: Replace the facet_wrap() with ~Condition .

indhist <- 
  NameOfDataset |> #Fix Step 1
  ggplot(aes(x = ResponseVariable))+ #Fix Step 2
  geom_WHATGEOM()+ # Fix Step 3
  facet_wrap(~GroupingVariable) # Fix Step 4