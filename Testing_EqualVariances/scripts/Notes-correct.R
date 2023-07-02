# Notes on Testing for Equal Variances

# Base R

## summary()
## Summarizes each variable in a dataset. Not useful if many variables.
iris |>
  summary()

library(dplyr)
## Better in that case to select the ones you want to look at first.
## select()
iris |>
  select(Petal.Length, Petal.Width, Species) |>
  summary()

library(ggplot2)
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

# Plotting residuals
## Given a linear model, you can just pass it through plot() and get 4 plots:
## Plot 1: Residual vs. Fitted Plot - Helpful to visually test assumptions.
## Plot 2: QQPlot of residuals to test normality.
## Plot 3: Scale-Location Plot - Are residuals equal across X.
## Plot 4: Residuals vs. Leverage - identifies any influential observations.

mtcars |>
  lm(mpg ~ disp, data=_) #|>
  #plot()
# We comment it out for submit() purposes.

library(rstatix)
# levene_test()
## It tests if there are differences in the variance between groups.
## Therefore, you can do y variable ~ grouping variable.

mtcars |> levene_test(mpg ~ as.factor(am))

## This grouping variable can be extended out beyond two levels.

iris |> levene_test(Petal.Length ~ Species)

## center = "mean"  v center="median"
## Levene's Test in R assumes the center of the test is a median.
## This is more robust. The original was testing around the mean.
iris |> levene_test(Petal.Length ~ Species, center=mean)

library(lmtest)
## Breusch-Pagan Test
mtcars |>
  lm(mpg ~ disp, data=_) |>
  bptest()



# Don't delete me!
saved <- "Y"