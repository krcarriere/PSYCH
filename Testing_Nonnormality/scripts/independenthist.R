# For histograms, the geom_ we want to add to the ggplot
# is usefully called geom_histogram() .
# Notice how the aes() in ggplot has changed to x= .
# sample = was a very specific case for geom_qq().

# Practice the same steps - rename the dataset to Sharks.
# Make your x axis equal PositiveRatings
# add the geom_ geom_histogram()
# Replace the facet_wrap() with ~Condition .

indhist <- 
  NameOfDataset |>
  ggplot(aes(x = ResponseVariable))+
  geom_histogram()+
  facet_wrap(~GroupingVariable)