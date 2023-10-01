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
                position=position_dodge(.5))+
  scale_y_continuous(breaks=seq(-.80, .60, 0.2),
                   labels =  number_format(accuracy = 0.01))+
  expand_limits( y=c(-.8, .60)) # Add here, we're continuing!
  # next up is theme(). theme() can take a LOT of arguments.
  # You can imagine theme() is changing everything that isn't about the data.
  # We'll pass two arguments through it. 

  # The first, legend.position, we want set equal to "top".
  # The second, legend.justification, we want set equal to "left".
