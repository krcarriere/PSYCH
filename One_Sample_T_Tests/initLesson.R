#One Sample T Tests

#ttest  <- readPNG(getURLContent("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/t/5af4ad7faa4a99e2a1dd573d/1525984651572/one-samplet.png?format=300w"))
#ttable <- imager::load.image("https://static1.squarespace.com/static/5a1855c81f318d6ebcce6e54/5af4702e88251b5dfff59172/5af47083f950b75b26d26b57/1525969030394/tdistribution_q1.png?format=500w")
scores <- c(62, 92, 75, 68, 83, 95)


df <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
pointten <- c(6.314, 2.920, 2.353, 2.1321, 2.015, 1.943, 1.895, 1.860, 1.833, 1.813)
pointzerofive <- c(12.706, 4.303, 3.182, 2.776, 2.571, 2.447, 2.365, 2.306, 2.262, 2.228)
pointone <-c(63.657, 9.925, 5.841, 4.604, 4.032, 3.708, 3.500, 3.356, 3.250, 3.170)
twotailed <- data.frame(df, pointten, pointzerofive, pointone, row.names = paste0(" ", 1:10))
rm(df, pointten, pointzerofive, pointone)


ttest <- "t=$\\frac{\\bar{x} - \\mu}{\\frac{s}{\\sqrt{N}}}$ where s equals s=$\\sqrt{\\frac{\\sum{}{}(X-\\bar{x})^2}{N-1}}$"
plot.equation <- function(equation){
  require(latex2exp)
  plot(TeX(equation), cex=2)
}

swirl_options(swirl_logging = TRUE)
