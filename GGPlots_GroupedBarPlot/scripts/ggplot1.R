# This is where we left off.
plot <-
  p_sum |>
  ggplot(aes(x=Target, y=mean, fill=Perspective)) +
  geom_col(color="black",
           width=0.5,
           size=.2,
           position=position_dodge(.5)) +
  #Add after this, we're continuing on!
  scale_fill_manual(values=c("darkgrey", "white"))
  # Next, we want to plot our error bars. We can add the geom geom_errorbar().
  # geom_errorbar() will take four arguments, just like geom_col.
  # 1: The first argument will be aes(). geom_errorbar needs two things in aes.
      # ymin = it needs a minimum of y (how low should my error bar go?)
      # ymax = it needs a maximum of y (how high should my error bar go?)
      # We know that we want +/- 1 Standard Error. +/- 1 SE from what? From the mean!
      # So in aes(), we want to define ymin= mean-se, and define ymax as...?
  # 2: We want the width to equal .1
  # 3: We want the linewidth to equal .2
  # 4: We want the position to also be equal to position_dodge(.5) 
