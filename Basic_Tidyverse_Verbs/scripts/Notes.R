#Tidyverse Notes

# select() 
## select() is used to select certain columns that we either want to keep 
## or want to not keep. Since we are subtracting a column, it would be - .
## Select can also move the order of the columns around if you tell it to
## keep everything using everything().

## An additional note to select() is that the output of select() is still a dataframe.
## That is, selecting a single variable creates a dataset of 1 column.

## That is different than pull(), which gets the column and makes it a list.

## A final (and important) note to select() is that some packages also have a select() function.
## Depending on the order in which you load things, it might not work. You may drive yourself
## Crazy trying to figure this out. If you get a select() error, 
## Put the library in front, such as dplyr::select() . This tells R to look for the select()
## function from dplyr.

iris |>
  names()

iris |>
  select(Sepal.Length) |>
  names()


iris |>
  dplyr::select(Petal.Length, Species, everything()) |>
  names()

iris |>
  dplyr::select(-Petal.Length, -Species) |>
  names()

# filter()
## filter() is used to reduce the number of rows, compared to select() to reduce the number of columns.
iris |> 
  filter(Species!="setosa") |>
  nrow()

iris |> 
  filter(Species!="setosa" & Sepal.Length > 5.5) |>
  nrow()

iris |> 
  filter(Species!="setosa") |>
  filter(Sepal.Length > 5.5) |>
  nrow()

## Advanced filter() to pull out only the significant values of some test.
library(ggplot2)
mpg |>
  lm(displ ~ fl + cyl, data=_) |>
  summary() |>
  purrr::pluck(coefficients) |>
  as.data.frame() |>
  tibble::rownames_to_column() |>
  filter(`Pr(>|t|)` < .05)


# mutate()
## mutate() creates new variables.
## Be sure to re-save your data or save it as something new.
iris <- 
  iris |>
  mutate(
    DoublePL = Petal.Length*2
  ) 
names(iris)

## Multiple mutates use commas
iris <- 
  iris |>
  mutate(
    DoublePL = Petal.Length*2,
    DoubleSL = Sepal.Length*2
  ) 
names(iris)

## case_when
### case_when() is one of the fastest and cleanest ways to rename variables or create new variables.
### It has a relatively straightforward set up - on the left side of the ~ , set something that evaluates as 
### true or false. On the right hand side, set what you want the variable to be.
iris |>
  mutate(
    FavFlower = case_when(
      Species=="setosa" ~ "My favorite",
      Species=="virginica" ~ "2nd favorite",
      Species=="versicolor" ~ "Least favorite"
    )
  ) |>
    dplyr::select(FavFlower, Species) |>
    table()
  
# mutate with rowwise() and ungroup()
## If you want to take an average across multiple columns, 
## you need to first tell R you want it
## to consider things per row, thus we use rowwise().
iris |> 
  mutate(#You forgot to rowwise()!
    WrongAvgPetal = mean(c(Petal.Length, Petal.Width), na.rm=TRUE) #Global average.
  ) |>
  rowwise() |> #Do this first!!
  mutate( # Then mutate
    AvgPetal = mean(c(Petal.Length, Petal.Width), na.rm=TRUE) # Individual average.
  ) |>
  # to undo rowwise() or group_by(), use ungroup()
  ungroup() |>
  mutate(
    WrongAvgSepal = mean(c(Sepal.Length, Sepal.Width), na.rm=TRUE)
  ) |>
  select(WrongAvgPetal, AvgPetal, WrongAvgSepal) |> #and see how these variables are very different.
  head()


# summarise()
## summarise() reduces our dataset down. It creates a new dataset.
## Therefore, any entry into summarise() is a new variable in this new dataset.
iris |>
  summarise(
    meanPL=mean(Petal.Length, na.rm=TRUE),
    sdPL = round(sd(Petal.Length, na.rm=TRUE),2),
    nPL = sum(!is.na(Petal.Length)),
    # Note: We use this way to get the N. This gets the N for all non-missing obs.
    sePL = round(sdPL/sqrt(nPL),2) # SE = SD/sqrt(N), so we use the variables we've created.
    ) 

# group_by()
## We can use group_by() to group things by one (or more) variables before
## summarising them. Note, if the data is group._by()'d, then select() will
## always force you to carry along the group_by() variables as well. If 
## you don't want that, you have to first ungroup() prior to select().

iris |>
  group_by(Species) |>
  summarise(
    meanPL=mean(Petal.Length, na.rm=TRUE),
    sdPL = round(sd(Petal.Length, na.rm=TRUE),2),
    nPL = sum(!is.na(Petal.Length)),
    # Note: We use this way to get the N. This gets the N for all non-missing obs.
    sePL = round(sdPL/sqrt(nPL),2) # SE = SD/sqrt(N), so we use the variables we've created.
  ) 

## Bar Graph summarise()
# This specific combination of summarise gives us means and standard errors.
# Since that is what we plot in grouped bar graphs, this is the starting point
# for a lot of APA graphs.
iris |>
  group_by(Species) |>
  summarise(
    mean=mean(Sepal.Width, na.rm=TRUE),
    sdSW = sd(Sepal.Width, na.rm=TRUE),
    nSW = sum(!is.na(Sepal.Width)),
    seSW = sdSW/sqrt(nSW)
  ) 



# arrange()
## arrange() just sorts our dataset by a variable. It's default is in ascending order.
iris |>
  group_by(Species) |>
  summarise(
    mean=mean(Sepal.Width, na.rm=TRUE),
    sdSW = sd(Sepal.Width, na.rm=TRUE)
  )  |>
  arrange(mean) 
# Note, we arrange by mean because we're playing with that new
# dataset we made in summarise.
  
## you can use desc() to make it in descending order.
iris |>
  group_by(Species) |>
  summarise(
    mean=mean(Sepal.Width, na.rm=TRUE),
    sdSW = sd(Sepal.Width, na.rm=TRUE)
  )  |>
  arrange(desc(mean))

# pull()
## Pull generally works like $. If you ever use data$variable, you could also do data |> pull(variable) .
mean(iris$Sepal.Width)

iris |>
  pull(Sepal.Width) |>
  mean()

###########################
# Resources to Learn More #
###########################
# Kieran Healy does a fantastic job with data visualization in this book.
# Healy, K. (2018). Data visualization: A practical introduction. Princeton University Press.

# Danielle Navarro published her R book Open Access. It's a fantastic resource for Psychology.
# Navarro, D. (2019). Learning statistics with R: A tutorial for psychology students and other beginners (E. Kothe, Trans.; Bookdown Edition). Self-Published. https://learningstatisticswithr.com/book/

# More advanced R coding including text mining / text analysis; also available online.
# Silge, J., & Robinson, D. (2017). Text mining with R: A tidy approach (First edition). O’Reilly.

# The paper introducing the tidyverse.
# Wickham, H., Averick, M., Bryan, J., Chang, W., McGowan, L., François, R., Grolemund, G., Hayes, A., Henry, L., Hester, J., Kuhn, M., Pedersen, T., Miller, E., Bache, S., Müller, K., Ooms, J., Robinson, D., Seidel, D., Spinu, V., … Yutani, H. (2019). Welcome to the Tidyverse. Journal of Open Source Software, 4(43), 1686. https://doi.org/10.21105/joss.01686

# The second edition of R for Data Science:
# Wickham, H., Çetinkaya-Rundel, M., & Grolemund, G. (2023). R for Data Science (2e ed.). https://r4ds.hadley.nz/


#don't delete me!
saved <- "Y"