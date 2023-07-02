
onesamplet <- "t = $\\frac{\\bar{x}-\\mu}{\\frac{S}{\\sqrt{n}}}$"
plot.equation <- function(equation){
  require(latex2exp)
  plot(TeX(equation), cex=1.5)
}

plot.equation(onesamplet)