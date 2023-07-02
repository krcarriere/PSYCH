# Notes on Paired Samples T-Test

# R doesn't have great wide example data sets, so we have to set one up.
sleep_wide <- sleep |>
  dplyr::mutate(
    group = 
      dplyr::case_when(group==1 ~ "TOne",
                group==2 ~ "TTwo")
  ) |>
  tidyr::pivot_wider(id_cols=ID, names_from=group, values_from=extra)

# t.test()
# Data in two numeric vectors
t.test(sleep_wide$TOne, sleep_wide$TTwo, paired=TRUE)

## Pair() 
### There is a way to write it as a formula, but we find it clunky to teach.
sleep_wide |> t.test(Pair(TOne, TTwo) ~ 1, data=_)

# Long Datasets T-Test -- It can be a formula.
sleep |> t.test(extra ~ group, data=_, paired=TRUE)

# Effect Size of Paired Samples
library(effsize)
## within=TRUE
## It should be noted in this example, within=TRUE is smaller. Yet, in the module example,
## within=TRUE is larger. Thus, we make no claims against the example data. It truly just is 
## the wild west of effect sizes.
effsize::cohen.d(sleep_wide$TOne, sleep_wide$TTwo, paired = TRUE, na.rm = TRUE)

## within=FALSE
effsize::cohen.d(sleep_wide$TOne, sleep_wide$TTwo, paired = TRUE, na.rm = TRUE, within=FALSE)

library(lsr)
lsr::cohensD(sleep_wide$TOne, sleep_wide$TTwo, method="paired") # within=FALSE
lsr::cohensD(sleep_wide$TOne, sleep_wide$TTwo, method="pooled")
lsr::cohensD(sleep_wide$TOne, sleep_wide$TTwo, method="y.sd")
lsr::cohensD(sleep_wide$TOne, sleep_wide$TTwo, method="x.sd")
lsr::cohensD(sleep_wide$TOne, sleep_wide$TTwo, method="raw")
lsr::cohensD(sleep_wide$TOne, sleep_wide$TTwo, method="corrected")

library(rstatix)
sleep |> rstatix::cohens_d(extra ~ group, paired=TRUE) #within=FALSE

# Citations on Discussions of Effect Size:

# Web Resources 
# https://stats.stackexchange.com/questions/448848/cohens-d-for-pairwise-t-tests-conflicting-results-from-manual-calculation-and
# https://real-statistics.com/students-t-distribution/paired-sample-t-test/cohens-d-paired-samples/ 
# http://jakewestfall.org/blog/index.php/2016/03/25/five-different-cohens-d-statistics-for-within-subject-designs/ 

# Bonett, D. G. (2015). Interval Estimation of Standardized Mean Differences in Paired-Samples Designs. Journal of Educational and Behavioral Statistics, 40(4), 366–376. https://doi.org/10.3102/1076998615583904
# Lakens, D. (2013). Calculating and reporting effect sizes to facilitate cumulative science: A practical primer for t-tests and ANOVAs. Frontiers in Psychology, 4. https://doi.org/10.3389/fpsyg.2013.00863

#don't delete me

saved <- "Y"