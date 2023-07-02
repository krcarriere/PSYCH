pairedttest <- "$t_{paired} = \\frac{\\bar Y_d - \\mu_0}{\\frac{s}{\\sqrt{n}}}"
plot.equation <- function(equation){
  require(latex2exp)
  plot(TeX(equation), cex=1.5)
}
plot.equation(pairedttest)