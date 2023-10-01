# This is where we left off.
plot <- 
  p_sum |>
  ggplot(aes(x=Target, y=mean, fill=Perspective)) +
  geom_col(color="black",
           width=0.5,
           linewidth=.2,
           position=position_dodge(.5)) +
  scale_fill_manual(values=c("darkgrey", "white"))+
  geom_errorbar(aes(ymin=mean-se,
                    ymax=mean+se),
                width=.1,
                linewidth=.2,
                position=position_dodge(.5))