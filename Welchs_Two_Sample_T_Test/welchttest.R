
welchttest <- "t = $\\frac{\\bar{x}_1-\\bar{x}_2}{\\sqrt{\\frac{s^2_1}{n_1}+ \\frac{s^2_1}{n_2}}}$"
plot.equation <- function(equation){
  require(latex2exp)
  plot(TeX(equation), cex=1.5)
}

plot.equation(welchttest)