#Paired qqplot

# For this, we're going to start off real small.
# Change the NameOfDataset to be Stickers.
# Change the VariableYouAreTesting to be Difference.Kept

qqdiff <- NameOfDataset |>
  ggplot(aes(sample=VariableYouAreTesting))+
  geom_qq() + 
  geom_qq_line() 
