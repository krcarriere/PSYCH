# Pivot Longer

# Basics with 1 DV to pivot:
# (1): Ensure you have a variable that identifies each unit.
# (2): Pivot_longer, where:
# (2a): List the columns you DONT want to pivot with -c()
# (2b): Name the predictor column with names_to=""
# (2c): Name the response column with values_to=""
iris |>
  rowid_to_column() |>
  pivot_longer(cols =-c(Species, rowid),
               names_to="Measure",
               values_to="Value") |>
  head(10)

# You can name the columns many ways. For instance, maybe you only want to pivot
# columns that start with some phrase.
# Notice how this will NOT pivot Petal.Length or Petal.Width.
# There are many of these in the tidyselect package, including:
# ends_with(), contains(), matches().
iris |>
  rowid_to_column() |>
  pivot_longer(cols = starts_with("Sepal"),
               names_to="Measure",
               values_to="Value") |>
  head()

# Pivoting multiple variables. 
iris |>
  rowid_to_column() |>
  #To have this example behave easier, I rename the variables to be underscores.
  rename(c(Sepal_Length=Sepal.Length, Sepal_Width=Sepal.Width,
           Petal_Length=Petal.Length, Petal_Width=Petal.Width)) |>
  #But here, the difference is key - names_to gets an additional piece called ".value"
  #And we tell pivot that the variables are split by this underscore separator.
  pivot_longer(cols= -c(Species, rowid),
               names_to = c("Type", ".value"),
               # If you wanted this example to work without rename(),
               # names_sep takes regular expressions, and . means something special.
               # Therefore, you would need to escape the period with "\\."
               names_sep="_") |>
  head()

# Pivot Wider
# Pivot wider basically can un-do what longer does. Notice the difference in arguments.
# cols-->id_cols; names_to->names_from; values_to->values_from
iris |>
  rowid_to_column() |>
  pivot_longer(cols =-c(Species, rowid),
               names_to="Measure",
               values_to="Value") |>
  pivot_wider(id_cols=c(Species,rowid),
              names_from = "Measure",
              values_from = "Value")

# Multiple variables pivoting wider.
# To understand this, check what the data looks like before.
us_rent_income |>
  head()

us_rent_income |> 
  pivot_wider(
    names_from = variable,
    names_sep = ".",
    values_from = c(estimate, moe)
  )


# don't delete me!
saved <- "Y"