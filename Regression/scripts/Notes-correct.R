# Notes for Regression
library(dplyr)
# Part 1: It's Regression All The Way Down

## T-Tests
iris |>
  filter(Species!="virginica") |>
  t.test(Petal.Length ~ Species, data=_, var.equal=TRUE)
# Notice t=-39.493, df=98, p<.001. Mean in setosa = 1.462, mean in versicolor=4.260.

iris |>
  filter(Species!="virginica") |>
  lm(Petal.Length ~ Species, data=_) |>
  summary()
# Notice t=39.49, p<.001, Intercept Estimate = 1.462, Versicolor Estimate=2.798
# Notice that...
1.462+2.798 # (Add the estimate of versicolor with the intercept estimate).
# 4.260. Mean in versicolor. 

## ANOVAs
iris |>
  aov(Petal.Length ~ Species, data=_) |>
  summary()
# F value = 1180; df Species = 2, Residual df = 147, P Value <.001

iris |>
  lm(Petal.Length ~ Species, data=_) |>
  summary()
# F-statistic at the bottom of output (the model's F-statistic)
# F=1180, 2, 147 DF, p<.001
# Notice the 1.462 remains from T-Test, as does 1.462+2.798 for versicolor.

# Centering Variables
# Before centering
iris |>
  lm(Petal.Length ~ Species + Sepal.Width, data=_) |>
  summary() |>
  tidy() |>
  filter(term=="Sepal.Width" | term=="(Intercept)")

iris |>
  mutate(
    Sepal.Width.c = Sepal.Width - mean(Sepal.Width, na.rm=TRUE)
  ) |>
  lm(Petal.Length ~ Species + Sepal.Width.c, data=_) |>
  summary() |>
  tidy() |>
  filter(term=="Sepal.Width.c" | term=="(Intercept)")

# Moderation / Interaction
iris |>
  mutate(
    Sepal.Width.c = Sepal.Width - mean(Sepal.Width, na.rm=TRUE)
  ) |>
  lm(Petal.Length ~ Species*Sepal.Width.c, data=_) |>
  summary() |>
  tidy() 

# Logistic Regression
mtcars |>
  glm(am ~ mpg, data=_) |>
  summary()
# Log Odds, relatively meaningless; hard to interpret.

# coef()
# Provides the Estimates of a model in a list.
mtcars |>
  glm(am ~ mpg, data=_) |>
  coef() 

# exp()
# Turns log odds into odds ratios.
mtcars |>
  glm(am ~ mpg, data=_, family=binomial) |>
  coef() |>
  exp()
# A one unit increase in mpg is associated with a 5.09% increase in likelihood the car is a manual.

# Poisson distribution
#  You can switch to other distributions as well using the family= argument, such as the poisson distribution.
mtcars |> 
  glm(am ~ mpg, family=poisson,  data=_)  |>
  summary()

## Cleaning Your Output and Odds Ratio Standard Errors
# tidy()
# We include some additional code here to show how we might build out a table for reporting results.
# In particular, we use tidy() from the broom package to get our regression results into a table form.
# We also draw from Andrew Heiss's blogpost in this code to show how to calculate the standard error.
# #https://www.andrewheiss.com/blog/2016/04/25/convert-logistic-regression-standard-errors-to-odds-ratios-with-r/
# Step 0 - save the glm beforehand.
library(broom)

manual_mpg_glm <- 
  mtcars |> 
  glm(am ~ mpg, family=binomial,  data=_)

mtcars |> 
  glm(am ~ mpg, family=binomial,  data=_) |>
  tidy() |>
  mutate(
    term = c("Intercept", "Miles Per Gallon"), # Relabel top to bottom as you see fit.
    estimate = exp(estimate), # Turn this into an OR.
    var.diag = diag(vcov(manual_mpg_glm)),  # Variance of each coefficient
    or.se = sqrt(estimate^2 * var.diag), # See blog post.
    
    OR = round(estimate, 2), 
    SE = round(or.se, 2),
    tstat = round(statistic, 2),
    p.value = round(p.value, 3), 
    p.value = ifelse(p.value==0, "<.001", p.value),
    stars = ifelse(p.value>=.05,":(", ""),
    stars = ifelse(p.value<=.05, "*", stars),
    stars = ifelse(p.value<=.01, "**", stars),
    stars = ifelse(p.value<=.001, "***", stars)) |>
  dplyr::select(term, OR, SE, tstat, p.value, stars)


# Don't delete me!
saved <- "Y"