# Notes on Paired Samples T-Test
sleep
# R doesn't have great wide example data sets, so we have to set one up.
sleep_wide <- sleep |>
  dplyr::mutate(
    group = 
      dplyr::case_when(group==1 ~ "TOne",
                group==2 ~ "TTwo")
  ) |>
  tidyr::pivot_wider(id_cols=ID, names_from=group, values_from=extra)
############
# t.test() #
############

############
## Pair() ##
############
# Our updated module decided to go forward with Pair() in order to make it mirror other lessons.
# Note: Using Pair() in this way requires that we have the data in a "wide" format.
# Wide formats mean that each observation (Time 1, Time 2, Time 3) is its own column.
sleep_wide |> t.test(Pair(TOne, TTwo) ~ 1, data=_)

######################
# t.test() sans pipe #
######################
# You could of course do t.test() without the pipe. Notice, if you do, be sure you tell R that paired=TRUE.
# We don't need to do that above because we told it Pair() within the equation.
t.test(sleep_wide$TOne, sleep_wide$TTwo, paired=TRUE)

#####################
# rstatix::t_test() #
#####################

# It may be the case that your data is in the long format, where each row is a participant-observation.
# So, in this case, each Participant would have X number of rows, where X is how many times they were sampled.
# If that is the case, then rstatix will be happy to help you out in analyzing this data.
sleep |> t_test(extra ~ group, paired=TRUE)

# Effect Sizes
# We recommend one of two possible pieces of code to measure the effect size of a paired t-test. 

# Wide data
######################
# effsize::cohen.d() #
######################
library(effsize)
effsize::cohen.d(sleep_wide$TOne, sleep_wide$TTwo,
                 paired = TRUE,
                 na.rm = TRUE, 
                 within=TRUE) #Important, within=TRUE. 
# Also important -- effsize has within=TRUE by default, so if you forget, it will assume you wanted it.
# We like that this is the default setting.

######################
# effectsize::rm_d() #
######################
library(effectsize)
effectsize::rm_d(sleep_wide$TOne,
                 sleep_wide$TTwo,
                 adjust=FALSE,
                 method="rm") # equivalent to the above. 

sleep_wide |> effectsize::rm_d(Pair(TOne, TTwo) ~ 1,
                 adjust=FALSE,
                 method="rm",
                 data=_)

# Long Data
######################
# effsize::cohen.d() #
######################
library(effsize)
sleep |> effsize::cohen.d(extra ~ group | Subject(ID),  # We like this less due to having to use Subject().
                          paired=TRUE,
                          na.rm=TRUE,
                          within=TRUE,
                          data=_)
######################
# effectsize::rm_d() #
######################
library(effectsize)
sleep |>
  # Note, both of these require you telling R a variable that ID's each participant. ( | ID). 
  effectsize::rm_d(extra ~ group | ID, 
                   adjust=FALSE,
                   method="rm",
                   data=_)

######################################################################################
#  Why You Should Use within=TRUE in effsize:: or effectsize::rm_d(method="rm")      #
# We attempt to talk through, in basic language, why we opt for this approach.       #
# If you were looking for a more statistical reasoning, the citations below suffice. #
######################################################################################

# We point the interested reader (or teacher) to the following:
# Bonett, D. G. (2015). Interval Estimation of Standardized Mean Differences in Paired-Samples Designs. Journal of Educational and Behavioral Statistics, 40(4), 366–376. https://doi.org/10.3102/1076998615583904
# Cohen, (1988). Statistical power for the behavioral sciences. (Specifically, pp. 48-49).
# Dunlap, W. P., Cortina, J. M., Vaslow, J. B., & Burke, M. J. (1996). Meta-analysis of experiments with matched groups or repeated measures designs. Psychological Methods, 1(2), 170-177. doi.org/10.1037/1082-989X.1.2.170 
# Lakens, D. (2013). Calculating and reporting effect sizes to facilitate cumulative science:  a practical primer for t-tests and ANOVAs. Frontiers in Psychology, 4, 863.10.3389/fpsyg.2013.00863

# Overall, we are not stating that we are definitively accurate in our methods, and you
# should probably defer to your professor on their own best method. Instead, we hope
# that we have highlighted how nuanced a discussion as simple as "how do we divide 
# a mean by a standard deviation" can get. 

# The main take away of these papers is that mathematically, yes, the paired t-test
# is a one-sample t-test, because we are taking the mean differences, and comparing
# if those mean differences are zero.

# However, there's a problem if we blindly proceed with this assumption. 

# As Cohen writes, "If one were to compute the product moment r (correlation coefficient)
# between the X and Y values for each pair in the population, the result would in 
# general be a nonzero value.... In contrast, with independent samples such as
# have been described in previous sections of this chapter, 
# the random pairing of X and Y values implied would perforce yield a population r of zero."

# The correlation of pairs ! This leads to 
# a given difference between population means for matched (dependent) samples is 
# standardized by a value which is sqrt(2*(1-r)) as large as would be the case were they independent.

# In other words - the effect size is inflated, and it should be adjusted by dividing
# the effect size by sqrt(1-r).

# Dunlap et al (1996) even go as far as to call it an overestimation of the effect size.
# (Even though, as Lakens 2013 notes, when the correlation > .50, cohen's d (one-sample'd) will be larger than
# Cohen’s d adjusted and when correlation  is smaller than 0.5, Cohen’s d (one-samp) will be smaller than
# Cohen’s d adjusted.)

# We're going to proceed with some calculations, and discuss the different package options.

# Effect Size of Paired Samples
library(effsize)
# First, let's show the 'inflated' way to calculate Cohen's D for paired samples.
effsize::cohen.d(sleep_wide$TOne, sleep_wide$TTwo,
                 paired = TRUE,
                 na.rm = TRUE, 
                 within=FALSE)
# The effect size reported by effsize when within=FALSE is -1.2845.
library(dplyr)
library(magrittr)

# This shows how this is calculated by hand.
sleep_wide |>
  mutate(
    diff = TOne - TTwo # First, we create a new variable that gets the difference score.
    ) |>
  summarise(
    mean = mean(diff), # Then we get the mean of that score.
    sd = sd(diff) # And we get the SD of that score. 
  ) %$% # this is a fancy pipe from magrittr. Feel free to ignore this.
  (mean/sd) # A one-sample t-test is simply the sample mean divided by the sample SD. 

# And we get our effect size score of -1.2845.

# Now, let's calculate what Cohen says is what we should do.
## within=TRUE
sleep_wide %$% 
  cor.test(TOne, TTwo) |> # He says we should get the correlation coefficient.
  broom::tidy() |>
  dplyr::select(estimate) # so let's get it - .795

# 
sw_sum <- sleep_wide |>
  mutate(
    diff = TOne - TTwo,# First, we create a new variable that gets the difference score.
  ) |>
  summarise(
    mean = mean(diff), # Then we get the mean of that score.
    sd_z = sd(diff),
    sd_o = sd(TOne),
    sd_t = sd(TTwo)
  )

# Cohen provides a different way to calculate standard deviation for paired samples.
# This looks like a lot - but we're just plugging into Equation 9 of Lakens (2013).
corcoef <- .795
std.dev.pair <- (sqrt((sw_sum$sd_o^2)+(sw_sum$sd_t^2)-(2*corcoef*sw_sum$sd_o*sw_sum$sd_t)))
mean.diff <- sw_sum$mean
correction <- sqrt(2*(1-corcoef))
mean.diff/std.dev.pair*correction

# And we change our effect size from -1.2845 to -.8221. Which just so happens is...
effsize::cohen.d(sleep_wide$TOne, sleep_wide$TTwo,
                 paired = TRUE,
                 na.rm = TRUE, 
                 within=TRUE)

# Lakens (2013) discusses a wider range of approaches, many of which show up in the 
# effectsize package. He states: "my general recommendation is to report Cohen’s d rm or
# Cohen’s d av" (in comparison to Cohen's d z (the one-sample effect size)).

# And you can see his letters appear in the methods below.
effectsize::rm_d(sleep_wide$TOne, sleep_wide$TTwo, adjust=FALSE,  method="rm") #.82
effectsize::rm_d(sleep_wide$TOne, sleep_wide$TTwo, adjust=FALSE,  method="av") #.83
effectsize::rm_d(sleep_wide$TOne, sleep_wide$TTwo,  adjust=FALSE, method="z") #1.28

# Of course, Lakens (2013) gets even more specific, noting that drm and dav should also include 
# Hedges's corrections. 
effectsize::rm_d(sleep_wide$TOne, sleep_wide$TTwo, adjust=TRUE,  method="rm") #.75
effectsize::rm_d(sleep_wide$TOne, sleep_wide$TTwo, adjust=TRUE,  method="av") #.76

#################################################
# "Overestimations of the effect size" commands #
#################################################
# Lakens (2013) does a great job discussing why stating it is an 'overestimation' 
# may be harsh, but all of the commands below are other commands you could use and
# 'not' get the effect sizes we think you should report. You can just see how 
# easy it is to make a 'mistake'. 
# First - using effsize but setting within=FALSE instead of true.
effsize::cohen.d(sleep_wide$TOne, sleep_wide$TTwo, paired = TRUE, na.rm = TRUE, within=FALSE)
library(lsr)
# It only recommends this effect size for paired samples, but it is d_z.
lsr::cohensD(sleep_wide$TOne, sleep_wide$TTwo, method="paired") # within=FALSE
# As noted in our math notes section, this is also d_z.
effectsize::rm_d(sleep_wide$TOne, sleep_wide$TTwo,  adjust=FALSE, method="z") #1.28
# They also provide two other methods, Becker's d / Glass' delta
effectsize::rm_d(sleep_wide$TOne, sleep_wide$TTwo,  adjust=FALSE, method="b") #.79
# And treating it simply as independent samples.
effectsize::rm_d(sleep_wide$TOne, sleep_wide$TTwo,  adjust=FALSE, method="d") #.83

library(rstatix)
sleep |> rstatix::cohens_d(extra ~ group, paired=TRUE) #within=FALSE


#don't delete me

saved <- "Y"