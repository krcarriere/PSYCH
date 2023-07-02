# Notes for the Chi Squared section
#Base R

# pchisq()
## Given a chi square (q) and a df, get a p value. Set lower.tail=FALSE!
pchisq(q=.348, df=1, lower.tail=FALSE)

# qchisq ()
## Given an alpha level (p) and a df, get a critical chi square value.
# Set lower.tail=FALSE!
qchisq(p=.05, df=1, lower.tail=FALSE)

# |>
## The base R pipe. It can be read as "and then".
## It takes something on the left hand side (LHS) and passes it to the right (RHS).
## Generally, a dataset. But today, it'll mostly be tables.
## If it's the first argument asked, we're okay!
## If it's not the first argument asked, need to say data=_ with an underscore (or whatever is on the left).
## The _ acts as a named placeholder for the LHS. 

library(dplyr)
# Tidyverse Functions Used
# select()
## Given a dataset, choose a number of variables, separate each with a comma.
mtcars |> #pass your dataset
  select(am, vs) |> # choose X number of variables.
  head() # Run some function on these variables.

# filter()
## Pass a logical operator through it that can be evaluated TRUE/FALSE.
## It will keep any observations that are TRUE.
mtcars |>
  filter(qsec > 15) |>  
  # Note: Filter generally wants to come before select.
  # Because if you don't select the filter, you can't filter on it.
  select(am, vs) |>
  table()

# Libraries needed:
library(rstatix)
# chisq_test;
## chisq_test() tests for the dependence of two categorical variables.
## It requires passing a table() through it. 
## The example in module had correct=FALSE. This is for continuity correction.
## We generally recommend it to be TRUE (default).
mtcars |> #pass your dataset
  select(am, vs) |> # select variables to make your table
  table() |> #make it a table
  chisq_test() #not specifying correct will set it to TRUE (what we want).

# You can also save things to save some steps if doing it multiple times.
mtcars.Table <- mtcars |> #pass your dataset
  select(am, vs) |> # select variables to make your table
  table()  # It is now saved as mtcars.Table in your environment.

mtcars.Table |> chisq_test()


# chisq_descriptives()
## Gives information about proportions and expected values for the table().
mtcars |> #pass your dataset
  select(am, vs) |> # select variables to make your table
  table() |> #make it a table
  chisq_test() |> #do the chi square
  chisq_descriptives() #get more information, including col and row proportions.


library(rcompanion)
# cohenW()
## An effect size calculation for chi square. It takes a table() through it.
mtcars |> #pass your dataset
  select(am, vs) |> # select variables to make your table
  table() |> # make the table
  cohenW() # get the effect size.

# Because we have this saved already, you can do:
mtcars.Table |> cohenW()