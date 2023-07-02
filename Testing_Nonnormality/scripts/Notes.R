# Notes on Non-Normality
library(dplyr)

# General notes:

## If our response variable of interest is paired, we care solely on the difference variable of Group1 and Group2
## Not the distribution of Group1's and Group2's. 

## If our response variable is unpaired/independent/more than 2 groups, then we care
## about the distribution of each group. 

# qqplots

## All qqplot()s are best interpreted with the qqline, thus, to make these,
## be sure to run both at the same time.
qqnorm(iris$Petal.Length)
qqline(iris$Petal.Length)

## We can also make it with ggplot2.
library(ggplot2)
iris |>
  ggplot(aes(sample=Petal.Length))+
  geom_qq() + 
  geom_qq_line() 

## For independent samples, ensure your qqplots are facet_wrap'd by grouping variable.
iris |>
  ggplot(aes(sample=Petal.Length))+
  geom_qq() + 
  geom_qq_line() +
  facet_wrap(~Species)

# Histograms
## The fast way is done through what we call base plotting - r's base system.
hist(iris$Sepal.Length)
## You pass changes to the plot into the function itself.
hist(iris$Sepal.Length, xlab="length of sepals")

## The ggplot2 way for paired, plotting the differences.
iris |>
  ggplot(aes(x = Petal.Length))+
  geom_histogram()

## The ggplot2 way for independent groups.
iris |>
  ggplot(aes(x = Petal.Length))+
  geom_histogram()+
  facet_wrap(~Species)

# Shapiro-Wilk 
library(rstatix)

# shapiro_test()
## Shapiro-Wilk can be done as we did in the module, that is:
iris |> 
  shapiro_test(Petal.Length)

## For multiple groups, use group_by() in dplyr.
iris |> 
  group_by(Species) |>
  shapiro_test(Petal.Length)

# Tidyverse Additional Verbs (pull())
## pull()
# We can combine a bit more advanced tidy verbs to pull out the variable of interest.
# But this seems like additional work for additional work's sake.

# It is important to note that in order to fully pipe, using pull() in these statements
# is required. select() keeps the variable in a dataset (with N=1 column) but pull()
# breaks the column back down to a list, which is what all of our functions in this module
# require. 

iris |> 
  pull(Petal.Length) |>
  qqnorm()

iris |> 
  pull(Petal.Length) |>
  hist()

iris |> 
  pull(Petal.Length) |>
  shapiro_test()

# On the other hand, these all will throw errors.
# To quickly uncomment, highlight the code and then use Ctrl(Cmd if Mac)+Shift+C.
# 
# iris |> 
#   dplyr::select(Petal.Length) |>
#   qqnorm()
# 
# iris |> 
#   qqnorm(Petal.Length)
# 
# iris |> 
#   dplyr::select(Petal.Length) |>
#   hist()
# 
# iris |>
#   hist(Petal.Length)
# 
# iris |> 
#   dplyr::select(Petal.Length) |>
#   shapiro_test()
# 
# Don't change me - this helps us move on.
saved <- "Y"