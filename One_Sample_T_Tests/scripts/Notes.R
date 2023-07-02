# Notes on One Sample T-Test

# t.test()
mtcars |> t.test(mpg ~ 1, data=_, mu=26.4) #EPA 2022 estimate

# cohen's d
## cohens_d() in rstatix
## This can give confidence intervals of d if ci=TRUE.
mtcars |>  rstatix::cohens_d(mpg ~ 1, mu=26.4, ci=TRUE)

## cohens_d() in effsize
## Can get effect sizes without being told.
mtcars |> effsize::cohen.d(mpg ~ 1, data=_, mu=26.4)
effsize::cohen.d(mtcars$mpg ~ 1, mu=26.4) #without piping.

## cohensD in lsr
## Cannot give effect sizes.
mtcars |> pull(mpg) |> lsr::cohensD(mu=26.4)
lsr::cohensD(mtcars$mpg)

# To test for normality of variable, Shapiro-Wilk.
## shapiro_test()
library(rstatix)
airquality |> shapiro_test(Temp)

## wilcox_test() as nonparametric one sample t-test
airquality |> wilcox_test(Temp ~ 1, mu=80)

## However, assumptions of wilcox_test(). Consider sign-test, but much weaker power.
airquality |> sign_test(Temp ~ 1, mu=80)

# summary table for means
  airquality |> 
  summarise(
    Mean = mean(Temp, na.rm=TRUE),
    SD = sd(Temp, na.rm=TRUE),
    N = sum(!is.na(Temp)),
    SE = SD/sqrt(N)
  ) |>
  round(2)


# dont delete me

saved <- "Y"