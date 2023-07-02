# Notes for Correlation Module

# cor()
# Outputs a correlation matrix with no other information.
iris |>
  select(Petal.Length, Petal.Width, Sepal.Length, Sepal.Width) |>
  cor()

# cor.test()
# Given two variables, provides df, t stat, 95% CI, p value, r.
cor.test(iris$Petal.Length, iris$Petal.Width)

library(rstatix)
# cor_test()
# Given x=>2 variables, provides df, t stat, 95% CI, p value, r.
# Acts in a pipe-friendly framework.
iris |> select(Petal.Length, Petal.Width) |> cor_test()

library(psych)
# corr.test()
# Given x=>2 variables, provides 2 outputs (plus more in options).
iris |> select(Petal.Length, Petal.Width, Sepal.Width) |> corr.test()
iris |> select(Petal.Length, Petal.Width, Sepal.Width) |> corr.test() |> print(short=FALSE)

library(corrplot)
# Given a base correlation matrix , output a correlogram.
# The vignette for corrplot is quite expansive, so. we leave the link here:
# https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html
iris |>
  select(Petal.Length, Petal.Width, Sepal.Length, Sepal.Width) |>
  cor() |>
  corrplot()

library(dplyr)
# ungroup()
# Correlation Matrices require data that is all continuous.
# This may mean that you might need to ungroup your data if you had grouped prior.

iris |>
  group_by(Species) |>
  select(Petal.Length, Petal.Width, Sepal.Length, Sepal.Width) |>
  #cor()  
  # THIS WOULD BREAK - group_by() has added Species into select()
  # and then you would be correlating a factor.
  ungroup() |>
  select(Petal.Length, Petal.Width, Sepal.Length, Sepal.Width) |>
  cor()

# Cronbach's Alpha
library(psych)
iris |> 
  select(Petal.Length, Petal.Width, Sepal.Length) |>
  alpha()

alpha <- iris |> 
  select(Petal.Length, Petal.Width, Sepal.Length) |>
  alpha() 
round(alpha$total$raw_alpha, 2)

# Don't delete me!
saved <- "Y"
try(dev.off(dev.list()["RStudioGD"]), silent=TRUE)