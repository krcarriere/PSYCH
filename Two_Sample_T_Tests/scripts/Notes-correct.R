#Notes for Independent Samples T-Test Module
mtcars <- mtcars |> 
  mutate(vs = factor(vs))

#t.test()
## t.test() takes response ~ explanatory, the data, and var.equal.

## It assumes var.equal=FALSE, so we have to explicitly tell it to be TRUE.
## If we don't, it does a Welch's T-Test (see different module).
mtcars |> 
  t.test(mpg ~ vs, data=_, var.equal=TRUE)

## While we are adamant pipers, it can be done without.

t.test(mtcars$mpg ~ mtcars$vs, var.equal=TRUE)



library(lsr)
# cohensD
## Default value for method="pooled". It is more conservative. 
mtcars |> cohensD(mpg~vs, data=_)

# Method = "raw" is a bit less conservative but does not mean it is biased any more than the first.
mtcars |> cohensD(mpg~vs, data=_, method="raw")


# group_by() and summarise()

# summarise()
## summarise() reduces our dataset down. It creates a new dataset.
## Therefore, any entry into summarise() is a new variable in this new dataset.
iris |>
  summarise(
    mean=mean(Petal.Length, na.rm=TRUE),
    sdSW = sd(Petal.Length, na.rm=TRUE)
  ) 

## We can use group_by() to group things by one (or more) variables before
## summarising them. Note, if the data is group._by()'d, then select() will
## always force you to carry along the group_by() variables as well. If 
## you don't want that, you have to first ungroup() prior to select().

iris |>
  group_by(Species) |>
  summarise(
    mean=mean(Sepal.Width, na.rm=TRUE),
    sdSW = sd(Sepal.Width, na.rm=TRUE)
  ) 

# Viewing data

## summary() gives the min, max, mean, 1st & 3rd quartile, median, of every var.
mtcars |> summary()
## head() gives the first 6 observations
mtcars |> head()
## View() opens it in RStudio
# mtcars |> View()
## tail() gives the last 6 observations
mtcars |> tail()
## Both head() and tail() can take a number as an argument to increase beyond 6.
mtcars |> tail(10)





# Don't delete me!
saved <- "Y"