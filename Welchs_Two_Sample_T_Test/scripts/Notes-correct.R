#Notes for Welch's T-Test Module
mtcars <- mtcars |> 
  mutate(vs = factor(vs))

#t.test()
## t.test() takes response ~ explanatory, the data, and var.equal.

## It assumes var.equal=FALSE.
## If we assume var.equal=TRUE, it does an Independent Sample's T-Test (see different module).
mtcars |> 
  t.test(mpg ~ vs, data=_, var.equal=FALSE)

## While we are adamant pipers and formulas when possible, it can be done without.

t.test(mtcars$mpg, mtcars$vs, var.equal=FALSE)


library(lsr)
# cohensD
mtcars |> cohensD(mpg~vs, data=_)

# group_by() and summarise()

# summarise()
## summarise() reduces our dataset down. It creates a new dataset.
## Therefore, any entry into summarise() is a new variable in this new dataset.
iris |>
  summarise(
    mean=mean(Petal.Length, na.rm=TRUE),
    sd = sd(Petal.Length, na.rm=TRUE),
    N = sum(!is.na(Petal.Length)),
    se = sd/sqrt(N)
  ) 

## We can use group_by() to group things by one (or more) variables before
## summarising them. Note, if the data is group._by()'d, then select() will
## always force you to carry along the group_by() variables as well. If 
## you don't want that, you have to first ungroup() prior to select().

iris |>
  group_by(Species) |>
  summarise(
    mean=mean(Sepal.Width, na.rm=TRUE),
    sdSW = sd(Sepal.Width, na.rm=TRUE),
    N = sum(!is.na(Petal.Length)),
    se = sdSW/sqrt(N)
  ) 

# Don't delete me!
saved <- "Y"