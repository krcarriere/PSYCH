cohensdiff <- "$d = \\frac{|\\bar{x}_1-\\bar{x}_2|}{\\sqrt{\\frac{((n_1-1)\\cdot s^2_1) + ((n_2-2)\\cdot s^2_2)}{n_1+n_2-2}}} \\\ d= \\frac{|\\bar{x}_1-\\bar{x}_2|}{\\sqrt{\\frac{((n_1-1)\\cdot s^2_1) + ((n_2-2)\\cdot s^2_2)}{n_1+n_2}}}$"
plot.equation <- function(equation){
  require(latex2exp)
  plot(TeX(equation), cex=1.5)
}
plot.equation(cohensdiff)