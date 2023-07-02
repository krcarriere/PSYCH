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
                #Add after this, we're continuing!
                position=position_dodge(.5))
  # Next up, let's set the y axis to be correct. 
  # The ggplot2 fn scale_y_continuous() can help us here.
  # We should pass it two arguments.
    # The first, breaks, will equal seq(-.80, .60, 0.2)
      # That means we want to have breaks from -.8 to .6 every 0.2. 
    # The second, labels, will equal number_format(accuracy = 0.01) 
      # This will round our y axis text to 2 decimal points. 

  # After you've done that, add from scale_y_continuous()+ to another layer.
  # this will be expand_limits(). expand limits will expand the ggplot area.
  # we want expand_limits() to take one argument, y=c(-.80, .60) for the limits of the plot.
