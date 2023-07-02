# This is where we left off.
plot <- 
  p_sum |>
  ggplot(aes(x=Target, y=mean, fill=Perspective)) +
  geom_col(color="black",
           width=0.5,
           size=.2,
           position=position_dodge(.5)) +
  scale_fill_manual(values=c("darkgrey", "white"))+
  geom_errorbar(aes(ymin=mean-se,
                    ymax=mean+se),
                width=.1,
                linewidth=.2,
                position=position_dodge(.5))+
  scale_y_continuous(breaks=seq(-.80, .60, 0.2),
                   labels =  number_format(accuracy = 0.01))+
  expand_limits( y=c(-.8, .60))+
  theme(
    legend.position = "top",
    legend.justification ="left") #Add from here, we're almost there!

  # You're doing great. Let's clean up a few more pieces.
  # The y axis label, ylab(), should be "Wise Reasoning" as the argument.
  # The x axis label, xlab(), should be "", because there isn't one.
  
  # R hasn't given us a x axis line at zero.
  # We can add horizontal lines using geom_hline().
    # geom_hline() needs at least one argument, yintercept, which we want equal to 0.
    # We'll also reduce the size, setting size = 0.3 .

  # And finally, there's a tiny line between the two targets.
  # We can add a geom_segment() to draw that line. We need 5 arguments
  # It needs to know where it begins on the x axis (x=1.5) and where it ends (xend=1.5)
  # It needs to know where it begins on the y axis (y=0) and where it ends (yend=-.02)
  # Finally, let's make the size really small, size=.2
