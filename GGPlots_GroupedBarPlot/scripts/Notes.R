# Notes



# To make a grouped bar chart, first summarise your data.
# Group it by the factors you care about.
mtcars |> 
  mutate(
    vs = factor(vs),
    am = factor(am)
  ) |>
  group_by(vs, am) |>
  summarise(
  n_mpg      = sum(!is.na(mpg)),
  mean_mpg   = mean(mpg, na.rm=TRUE),
  sd_mpg     = sd(mpg, na.rm=TRUE),
  se_mpg     = sd_mpg / sqrt(n_mpg)) |>
  
  # Then pass that new dataset into ggplot().
  
  ggplot(aes(x=vs, y=mean_mpg, fill=am))+
  
  #geom_col creates our columns
  geom_col(
  #position=position_dodge allows the columns to spread out.
    # the number expands how much of that spread there is.
    position=position_dodge(.5),
    # color = changes the border of the shape
    colour="black",
    # width changes how wide the bars themselves are.
    width=0.5,
    # size changes how wide the outline of the shape is.
    size=.2)+
  
  # You have to define as many colors as your fill variable has levels.
  # You can also change the color itself if you didn't define in inside.
  # through scale_color_manual. 
  scale_fill_manual(values=c("grey40", "grey"))+
  
  # Labels and titles are straight forward.
  xlab("Something")+
  ylab("Avg MPG")+
  ggtitle("A title!")+

  # The error bar is its own geom.
  geom_errorbar(
    #However, it does need aesthetics, it needs the mapping. Which is why 
    # in summarise() we calculated se. It needs a ymin and a ymax.
    aes(
    ymin=mean_mpg-se_mpg,
    ymax=mean_mpg+se_mpg),
    # width changes the width of the whiskers themselves.
    width=.3, 
    # linewidth changes the width of the line,
    linewidth = .2,
    # Make sure your dodge is equal to the dodge of the geom_col.
    position=position_dodge(.5))+
  
  # We can be explicit about the scale of our y axis.
  scale_y_continuous(
    # For example, we can clarify the range of the y axis and at how many ticks it should break.
    # such as breaks every 6 mpg.
    breaks=seq(0, 30, 6),
    # We can also explicitly call out, using the scales library, how much rounding we want.
    labels =  number_format(accuracy = 0.1))+
  
  # It's good to ensure that your graph's limits are equal to your breaks.
  expand_limits( y=c(0, 30))+
  
  # There are a ton of kinds of themes. You just have to learn by playing.
  # To remove things, Some of them want element_blank() and some want = "none".
  # For example, legend.position="none" makes the legend go away.
  # legend.position = element_blank() would not work.
  
  # If you don't want to figure it out piece by piece, there are a few
  # baseline themes you can choose. Instead of theme( with a large list).
  # just try adding one of theme_bw(), theme_minimal(), theme_classic(), 
  # theme_tufte, or even install the jtools library and use theme_apa().
  theme(legend.justification ="left",
        legend.position = "top",
        legend.direction = "horizontal",
        legend.title = element_blank(),
        legend.text = element_text(face="bold"),
        legend.key.size= unit(.25, "cm"),
        panel.grid = element_blank(),
        panel.background = element_blank(),
        axis.line.y = element_line(linewidth = .2, colour = "black"),
        axis.text.x = element_text(face="bold"),
        plot.caption = element_text(hjust = 0)
  )+
  # You can add horizontal and vertical lines to places.
  geom_hline(yintercept=2, size=.3)+
  geom_vline(xintercept=1.5, color="blue")+
  # You can also add lines of your own.
  geom_segment(y=0, yend=-.02, x=1.5, xend=1.5, size=.2)


#don't delete me!
saved <- "Y"