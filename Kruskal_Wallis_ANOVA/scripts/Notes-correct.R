#Notes for Kruskal-Wallis Module

##########################
# Checking for Normality #
##########################
library(ggplot2)
iris |>
  ggplot(aes(x = Species, y = Petal.Width)) +
  geom_boxplot()

# The boxplots suggest that the distributions are not normal, but let's confirm this with the Shapiro-Wilk test
# We'll group the data by Species and use the shapiro_test function from the rstatix package
library(rstatix)
iris |> 
  group_by(Species) |> 
  shapiro_test(Petal.Width)

# We can also examine this visually through histograms.
iris |>
  ggplot(aes(x = Petal.Width)) +
  geom_histogram(bins=20)+
  facet_wrap(~Species)+
  xlab("Petal Width")+
  ylab("Frequency")

# Or through qqplots
## QQPlots are used to plot the distribution of the variable on the x axis
## And the theoretical distribution of where it should fall on a normal distribution.
## If it lands on the line, it is following the normal distribution. Off of the line,
## It's probably not normal. 
iris |>
  ggplot(aes(sample = Petal.Width)) +
  geom_qq() +
  geom_qq_line() +
  facet_wrap(~Species)+
  xlab("Observed")+
  ylab("Theoretical normal distribution")

# There is also the ability to do this all at once.
library(onewaytests)
iris |> nor.test(Petal.Width~Species, data=_)

dev.off()

##################
# kruskal_test() #
##################
library(rstatix)
## It takes an equation.
mtcars |>
  kruskal_test(mpg ~ gear)

# kruskal_effsize()
## Gets you the partial eta-squared for your test.
## You can also generate the confidence intervals of the effect size with ci=TRUE, however,
## It is bootstrapped and will take some time to calculate.

# mtcars |>
# kruskal_effsize(mpg ~ gear, ci=TRUE)

# dunn_test()
## Post-hoc test for kruskal-wallis.
mtcars |> 
  dunn_test(mpg~gear,
            p.adjust.method="bonferroni") 

## You can use filter and select to reduce the amount of output.
## But note, you should always filter afterwards unless you know what you're doing,
## Since we want p.adjust.method to be true to how many tests were being compared.
mtcars |> 
  dunn_test(mpg~gear,
            p.adjust.method="bonferroni") |>
  filter(p.adj<.05) |>
  select(-n1, -n2)

library(stringr)
# str_detect()
## stringr is part of the tidyverse library and handles strings. It does a solid job.
## str_detect() takes two arguments - what am i searching, and what am I looking for.
## It will output true or false. We can use this TRUE or FALSE to filter things.

## str_detect is very finicky. It wants a list, not a dataset. So, we have to use pull()
## if using it on its own.
mtcars |> 
  tibble::rownames_to_column("CarModel") |>
  pull(CarModel) |>
  str_detect("Merc") |>
  table()

## Using it with filter() removes this step, because filter() knows to look just at a column.
mtcars |> 
  tibble::rownames_to_column("CarModel") |>
  filter(str_detect(CarModel, "Merc"))

# Don't delete me!
saved <- "Y"