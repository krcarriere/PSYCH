fig2 <- iris |> ggplot(aes(x=Species,y=Petal.Length, fill = Species, colour = Species))+
  PupillometryR::geom_flat_violin(position = position_nudge(x = .25, y = 0),
                                  adjust =2,
                                  trim = TRUE)+
  geom_point(position = position_jitter(width = .15),
             size = .25)+
  geom_boxplot(aes(x = (Species), y = Petal.Length),
               outlier.shape = NA,
               alpha = 0.3,
               width = .1,
               colour = "BLACK") +
  theme_cowplot()+ 
  ggtitle("Raincloud Plot")+
  scale_fill_manual(values = c("#798E87","#C27D38","#CCC591"))+
  scale_color_manual(values = c("#798E87","#C27D38","#CCC591"))+
  theme(legend.position = "none",
        axis.text.x = element_text(size=8))+
  ylab("Petal Length of Flowers")

plot(fig2)
rm(fig2)