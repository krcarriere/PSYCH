# Notes

library(ggplot2)
## facet_wrap()
## This creates separate plots based on a variable.
## The ~ makes it a one sided formula, which means theoretically you could
## facet on multiple variables (if that made sense to do). 
mtcars |>
  ggplot(aes(x = as.factor(am), y = mpg) ) +
  facet_wrap(~as.factor(cyl))

mtcars |>
  ggplot(aes(x = as.factor(am), y = mpg) ) +
  facet_wrap(~as.factor(cyl) + vs)


# geom_violin()
## Violin plots display distribution.
mtcars |>
  ggplot(aes(x = as.factor(am), y = mpg) ) +
  facet_wrap(~as.factor(cyl))+
  geom_violin()

## There are a lot of options that can go into geom_violin(), including:
mtcars |>
  ggplot(aes(x = as.factor(am), y = mpg) ) +
  facet_wrap(~as.factor(cyl))+
  geom_violin(
    fill = "black", #Inside
    alpha = 0.50, #Transparency
    colour = "white", #Outline
    draw_quantiles = 0.5 # A line to show a quantile as defined from 0:1.
  )

##ggplot()
## If a fill/color/group is defined in ggplot(aes()), it applies to every geom.
## If a fill/color/group is defined geom_(aes()), it applies to just that geom_.

# Since fill is in ggplot(), everything will be red/blue.
mtcars |>
  ggplot(aes(x = as.factor(am), y = mpg, fill=as.factor(am))) +
  geom_violin()+
  geom_boxplot()+
  scale_fill_manual(values=c("red", "blue"))

# Since fill is in geom_violin(), just the violin will be red/blue.
mtcars |>
  ggplot(aes(x = as.factor(am), y = mpg)) +
  geom_violin(aes(fill=as.factor(am)))+
  geom_boxplot()+
  scale_fill_manual(values=c("red", "blue"))

# We can vary this with color as well, note the different outline for boxplot.
mtcars |>
  ggplot(aes(x = as.factor(am), y = mpg)) +
  geom_violin(aes(fill=as.factor(am)))+
  geom_boxplot(aes(color=as.factor(am)))+
  scale_fill_manual(values=c("red", "blue"))+
  scale_color_manual(values=c("pink", "lightgreen"))



# theme()
## theme() has a bunch of features (check Grouped Bar Charts for more info).
## Here, we show legend.position="none" to remove the right legend.
mtcars |>
  ggplot(aes(x = as.factor(am), y = mpg)) +
  geom_violin(aes(fill=as.factor(am)))+
  geom_boxplot(aes(color=as.factor(am)))+
  scale_fill_manual(values=c("red", "blue"))+
  scale_color_manual(values=c("pink", "lightgreen"))+
  theme(
    legend.position="none"
  )

# library(ggbeeswarm)
## geom_quasirandom
## geom_quasirandom is very similar to geom_jitter(), but it seems to jitter only
## within the shape. The real paper uses geom_quasirandom(), but I didn't want to
## have you load an additional library that we won't use too much.
  mtcars |>
  ggplot(aes(x = as.factor(am), y = mpg) ) +
  facet_wrap(~as.factor(cyl))+
  geom_violin()+
  # geom_quasirandom(alpha = 0.3)
  # geom_point(position=position_jitter(.9))
  geom_jitter()


  
  saved <- "Y"
  

  
  