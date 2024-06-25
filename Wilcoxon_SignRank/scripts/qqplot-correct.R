# We're going to make a plot using ggplot.

# The plot is very straightforward - only 5 full lines of code.

# Line 1: Name the new object we'll be creating as WeightQQ
# Line 2: Take your data, Selfies, and pipe it
# Line 3: use the ggplot(aes()) function to run sample = WeightDiff and add a layer.
# Line 4: pass the function geom_qq() and add a layer.
# Line 5: pass the function geom_qq_line()

# We'll only do this once - don't worry about having to do it twice!

WeightQQ <- 
  Selfies |>
  ggplot(aes(sample=WeightDiff))+
  geom_qq()+
  geom_qq_line()