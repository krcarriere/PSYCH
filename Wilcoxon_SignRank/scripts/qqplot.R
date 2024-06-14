# We're going to make a plot using ggplot.

# The plot is very straightforward - only 5 full lines of code.

# Line 1: Name the new object we'll be creating as WeightQQ
# Line 2: Take your data, Selfies, and pipe it into...
# Line 3: the ggplot(aes()) function to pass sample = WeightDiff as the sole argument and add a layer.
# Line 4: pass the function geom_qq() and add a layer.
# Line 5: pass the function geom_qq_line()

# We'll only do this once - don't worry about having to do it twice!

NewObject <- 
  NameofDataset |>
  ______(___(______ = __________))+
  _______() +
  ____________()