
omega2x2 <- "$\\omega = \\sqrt{\\frac{\\chi^2}{n}}$"
plot.equation <- function(equation){
  require(latex2exp)
  plot(TeX(equation), cex=1.5)
}

plot.equation(omega2x2)