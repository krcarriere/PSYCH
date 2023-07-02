fig3 <-
  iris |>
  ggplot(aes(x=Species, y=Petal.Length))+
  geom_violin(
    aes(fill=Species))+
  scale_fill_manual(values = c("#798E87","#C27D38","#CCC591"))+
  stat_summary(
  fun = mean,
  geom = "point", size = 1,
  aes(group = Species),
  show.legend = FALSE
  )+
  theme_classic()+
  ggtitle("Violin Plots with Mean Point")+
  ylab("Petal Length of Flowers")

plot(fig3)
rm(fig3)