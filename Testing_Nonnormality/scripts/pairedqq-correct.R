qqdiff <- Stickers |>
  ggplot(aes(sample=Difference.Kept))+
  geom_qq() + 
  geom_qq_line() 
