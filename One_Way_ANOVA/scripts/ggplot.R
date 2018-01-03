#There's a lot going on in this file, and we'll approach it more in other lessons.

#In the next lesson, we're going to tackle both summarizing and plotting in more detail.

#Today, I just want you to fill in the first line.

#Remember that data should be called sum_data, x is Species, and y is now called Mean.

#When you're ready and have fixed this first line, save it and type submit().

graph <- ggplot2::ggplot(data=NAMEOFDATASET, aes(x=INDEPENDENTVARIABLE, y=SUMMARIZEDSTATISTIC)) +
  geom_bar(stat="identity", size=1.5, aes(fill=Species))+
  geom_errorbar(aes(ymax= Mean + SE, ymin = Mean - SE), width=.1)+
  scale_fill_manual(values=colors)+ 
  labs(y="Petal Length") +
  theme_bw()+
  theme(panel.border = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_blank(),
        legend.position="top", legend.title = element_blank())
