# Wilcoxon Sign-Ranked Test
oldw <- getOption("warn")
options(warn = -1)


# Table of Contents to Wilcoxon Signed Rank Test:
# Explaining What the WSR Test Does (Mathematically)
## mutate()
## pull()
## shapiro_test()
## ggplot2::geom_qq() + geom_qqline()
## hist()
## wilcox.test()
## effectsize::rank_biserial()
## interpret()
## Z score calculation

# Other Methods / Additional Code
## ggplot2 additions xlab(), ylab(), jtools:theme_apa(), scale_y_continuous()
## ggplot2 geom_histogram()
## qqnorm() and qqline()
## shapiro.test()
## wilcox.test() without the pipe
## pivot_longer()
## rstatix::wilcox_test() [requires long data]
## rcompanion::wilcoxonPairedRC() [another way to get rank_biserial]
# Reasons to avoid wilcox_effsize()
# Replicating Figure 2 (At least, the code needed).
# Advanced Coding Notes
## Learn about the %$% operator.

######################################################
# Explaining What the WSR Test Does (Mathematically) #
######################################################

# In short, the Wilcoxon Signed-Rank Test functions as a way to not test the means of two samples, but instead, their median.
# Mathematically, the Signed-Rank Test two for samples becomes the Signed-Rank Test for one sample, because we end up testing the Difference Score.

# With small datasets, this is actually an extremely easy test to calculate by hand. 
# The test has 5 steps: 
# 1. Calculate absolute value of differences
# 2. Rank these differences (small to large)
# 3. Reattach sign of difference
# 4. sum values for positive (W+) and negative (W-) differences
# 5. Assign test statistic as larger of W+ and W- for nondirectional HA.

# We'll first just walk through exactly what is occuring in this analysis, and then after that, get into the code.

library(PairedData) # This provides us with the example data used in these Notes.
data(Tobacco)
head(Tobacco)
# This dataset presents 8 paired data corresponding to numbers of lesions 
# caused by two virus preparations inoculated into the two halves of 
# each tobacco leaves.

# Remember, if you want to see what happens at any stage, simply start
# at the top of this chunk of code, and select everything until right before a |>.
# Copy, paste, and run that code, and see what the output is. 

Tobacco |> 
  mutate(
    Prep_Diff = Preparation_2-Preparation_1, # First, the difference scores are calculated.
    AbsDiff = abs(Prep_Diff) # 1. Calculate the absolute value of differences.
  ) |>
  dplyr::select(Prep_Diff, AbsDiff) |>
  arrange(AbsDiff) |> # Then, we order these differences by their absolute value, from lowest difference score to highest.
  mutate(
    Rank = rank(AbsDiff), # 2. We then assign these absolute values a rank, where ties get averaged.
    SignedRank = Rank*sign(Prep_Diff), # 3. We then reattach the sign of differences.
    PosNeg = sign(Prep_Diff) # The next step wants us to sum both the positive | negative values, so we create a var to help.
  ) |>
  group_by(PosNeg) |>
  summarise(
    sumrankedvalues = sum(SignedRank) # 4. sum values for positive (W+) and negative (W-) differences (see group_by() doing that second part.)
  ) |>
  dplyr::select(sumrankedvalues) |> 
  abs() |>
  max() # 5. Assign test statistic as larger of W+ and W- for nondirectional HA.

# The test statistic ends up being 34, which, as you will see below, is exactly what wilcox.test() tells us is the V (34)!
  
############
# mutate() #
############

# mutate() is part of the tidyverse library and it mutates the dataframe to 
# create new variables. Below, we make a variable called Prep_Diff, and importantly,
# we overwrite our Tobacco data. You could of course make this Tobacco2, but 
# why have two datasets of the same thing, just one without one variable?

Tobacco <- Tobacco |>
  mutate(
    Prep_Diff = Preparation_2-Preparation_1
  )

# If you had multiple new variables, simply add a comma after the expression,
# so it looks like:
# mutate(
# NewVar1 = expressiontocreateit, 
# NewVar2 = expressiontocreateit, 
# NewVar3 = expressiontocreateit
# )

# And be sure the last one has no comma. 

##########
# pull() #
##########

# pull() is a verb within the tidyverse, much like select() and mutate().
# It acts as a $ -- if you do data |> pull(variable), it is many times equivalent 
# to the idea of writing data$variable . 

# This one we acknowledge might be where our piping starts to get a bit... excessive.
# Both authors admit we would be much more likely to at this point use data$variable.

# Still, practice makes perfect, and readability matters!

Tobacco |> 
  pull(Prep_Diff) |>
  mean()

# is equivalent to

mean(Tobacco$Prep_Diff)

# We used pull() a lot in this lesson, so you can see other applications.
# Remember, if you would like, you always can default to data$variable.

##################
# shapiro_test() #
##################
#library(rstatix)
# Paired samples want to examine the difference variable when considering if there is non-normality.

Tobacco |>
  rstatix::shapiro_test(Prep_Diff)

# This dataset is actually totally fine to use as a paired t-test, but if you found it p<.05, 
# it's a flag that maybe you should consider Wilcoxon! There's more to test of course than just this.

# The things to remember about Shapiro Wilk is that it has low power when N is small.
# (It will struggle to detect a true effect if the effect does exist).

# But it becomes hyper sensitive (Inflated Type I Error Rate) when N is large.

##############
#  geom_qq() #
# in ggplot2 #
##############

Tobacco |>
  ggplot(aes(sample = Prep_Diff)) +
  geom_qq() +  # This plots the observed 
  geom_qq_line() # 

# The line represents where the observations should fall if they were distributed on 
# a normal distribution. Basically, it plots the quantiles of the actual data against
# what the data of a theoretical normally distributed quantile.

# Notice for this example, 7 of the observations are very close to the line. 
# This is pretty good and another reason why for this data, we seem to be okay
# with proceeding with a paired t-test.

##########
# hist() #
##########

Tobacco |>
  pull(Prep_Diff) |>
  hist()

# The histogram shows a pretty good looking normal-ish distribution. It's not 
# perfect by any means, but we have small samples, so we don't expect it to.

#################
# wilcox.test() #
#################
library(stats)
Tobacco |>
  wilcox.test(Pair(Preparation_1, Preparation_2) ~ 1, data=_)
# Things to notice:
# 1. We utilize Pair() to tie the two columns together as paired data.
# 2. We use ~ 1 to test it against an empty comparison. Because we have provided 
# Pairs, it tells the function that it should be a paired test.

# Therefore, this takes:
# Wide data (each variable should be a column).
# Pair() should wrap the two variables on the left hand side of the ~.

###################
# rank_biserial() #
###################
library(effectsize)
Tobacco |>
  rank_biserial(Pair(Preparation_1, Preparation_2) ~ 1, data=_)
# It is worth noting that we have yet to find another rank-biserial correlation effect-size function.

# All notes repeat for this, except this function comes from the effectsize library.

###############
# interpret() #
###############
#library(effectsize)
Tobacco |>
  rank_biserial(Pair(Preparation_1, Preparation_2) ~ 1, data=_) |>
  interpret(rules="cohen1988")
# This provides an additional column based on Cohen's cutoff points for effect sizes.
# You don't need this at all - it's easy enough to look at the effect size and be able
# to tell on your own, but if you couldn't remember what they were, this would be sufficient.

# You can dig into the documentation to find their rules and options-- 
vignette("interpret", "effectsize")

# Where the correlation coefficient effect sizes for Cohen 1988 are reported as:
# r <.1 - Very small
# .1 <= r < .3  - Small
# .3 <= r < .5 - Moderate
# >=.5 - Large


#######################
# Getting the Z Score #
#######################

# Many times, papers report the Z statistic instead of the V or W that R outputs.
# It is straightforward to calculate the Z - it is simply just part of the p value.

# Given a Wilcox.Test, save it.
testoutput <- Tobacco |>
  wilcox.test(Pair(Preparation_1, Preparation_2) ~ 1, data=_)

# Pass the p.value variable of the new object
testoutput$p.value

# Into qnorm and divide by two.
qnorm(testoutput$p.value/2)


#################
# Other Methods #
#################
# There are other ways in which you can run these analyses beyond what we cover.
# For the most part, the difference is purely based on whether or not the pipe 
# can be used, or in what form your data exists.

##############
# Some Basic #
#  ggplot()  #
#  additions #
##############
#library(jtools)
Tobacco |>
  ggplot(aes(sample = Prep_Diff)) + # Important <-- here, for geom_qq(), we want sample = , not x= or y=.
  geom_qq() + 
  geom_qq_line() +
  jtools::theme_apa() + # A neat function that will format things to be APA style.
  xlab("X Axis Label") +  # Put your axis labels in quotes!
  ylab('Y Axis Label') + # Single or double doesn't matter, just be consistent!
  scale_y_continuous(
    limits=c(-15,10), # We list the lowest tick first, then the highest possible tick last.
    breaks =c(-15, -10, -5, 1,2,3,4,5, 10)
  ) # A bit silly, but to show how you can control the axis ticks.

######################
#  geom_histogram()  #
######################
Tobacco |>
  ggplot(aes(x = Prep_Diff)) +
  geom_histogram() + 
  jtools::theme_apa() + # A neat function that will format things to be APA style.
  xlab("Difference Score") +  # Put your axis labels in quotes!
  ylab('Count of Observations') + # Single or double doesn't matter, just be consistent!
  scale_y_continuous(breaks = c(1,2,3)) # This can be nice, since you can't have half of a count.


###############
#   qqnorm()  #
# & qqplot()  #
###############

Tobacco |>
  pull(Prep_Diff) |>
  qqnorm()

qqline(Tobacco$Prep_Diff)

# This is another way to graph the same thing. You can do it both through piping
# or through not piping. However, if you use this qqnorm() function, then you do
# need to follow up with a qqline().

##################
# shapiro.test() #
##################
# Same thing, but requires the use of the pull operator.

Tobacco |>
  pull(Prep_Diff) |>
  shapiro.test()


#################
# wilcox.test() #
# without pipe  #
#################
# Obviously, you can do this without piping. This doesn't require Pair().
wilcox.test(Tobacco$Preparation_1, Tobacco$Preparation_2, paired=TRUE)
# However, notice that it DOES require paired=TRUE (the stand in for Pairs().

##################
# pivot_longer() #
##################
#library(tidyr)
# We go over this briefly in
# Pivoting Data Module, but what it means is that each [participant-measure] has its own 
# row, instead of each [participant] has its own row. 
# Since for paired samples, we have two observations for each participant, 
# it should double the number of rows.

head(Tobacco)

nrow(Tobacco) #8
Tobacco |> 
  tidyr::pivot_longer(cols= -Plant,
                      names_to="Measure", 
                      values_to="Value") |>
  nrow() #16

Tobacco |> 
  tidyr::pivot_longer(cols= -Plant, # the - signifies "not" this column.
                      names_to="Measure",   #What do you want to call the grouping column?
                      values_to="Value") |> # What do you want to call the DV column?
  head() # See how Plant remains, but the two columns Preparation_1 and Preparation_2 
# have gone away. In their place, there is two columns, one called Measure (names_to),
# and one called Value (values_to) 

#################
# wilcox_test() #
#################
#library(rstatix)
# This function works if your data is in a long-form. 

# Notice that this still requires the formula approach.
Tobacco |> 
  tidyr::pivot_longer(cols= -c(Plant, Prep_Diff),
                      names_to="Measure",
                      values_to="Value") |>
  rstatix::wilcox_test(Value ~ Measure, 
                       paired=TRUE, 
                       detailed=TRUE)

#############################
# Biserial Rank Correlation #
#############################
# A warning: As of writing this (5/24/24), we find very few alternatives that achieve
# a biserial rank correlation. A StackOverflow conversation from 2022 also shows
# very few options, and we explore their options below.
# https://stackoverflow.com/questions/21796779/rank-biserial-correlation-with-r

######################
# wilcoxonPairedRC() #
######################
#library(rcompanion)
# see: pivot_longer()
Tobacc_Long <- 
  Tobacco |> 
  tidyr::pivot_longer(cols= -c(Plant, Prep_Diff),
                      names_to="Measure", 
                      values_to="Value")

rcompanion::wilcoxonPairedRC(x = Tobacc_Long$Value, g = Tobacc_Long$Measure, verbose=TRUE)
# Things to note:
# This also provides our biserial rank correlation.
# It requires data in the long format.

# However, it does produce the biserial rank coefficient. 


########################
# Advanced Stats Notes #
########################

####################
# wilcox_effsize() #
####################
#library(rstatix)
#library(coin)

# We do not recommend wilcox_effsize from rstatix, as the effect size it reports is 
# not the biserial-rank correlation. 
Tobacco |> 
  tidyr::pivot_longer(cols= -Plant,
                      names_to="Measure",
                      values_to="Value") |>
  rstatix::wilcox_effsize(Value ~ Measure, 
                          paired=TRUE)
# This is because this effect size, r, is calculated as the
# estimate divided by the square root of N (see documentation).

# The rcompanion notes talks about this effect size, and they state:
# A common effect size statistic for the Mann–Whitney test is r, which is the z 
# value from the test divided by the total number of observations.  This statistic 
# has some drawbacks.  Under usual circumstances, it will not range all the way from –1 to 1.
# It is also affected by sample size.  These problems appear to get worse when 
# there are unequal sample sizes between the groups.
# https://rcompanion.org/handbook/F_04.html

# Can we find that? 
# The documentation for wilcox_effsize read: The effect size r is calculated as Z statistic divided by square root of the sample size 
# The Z value is extracted from ... coin::wilcoxsign_test() (case of...paired-samples test)

# This shows that V=34 as we expect.
Tobacco |>
  coin::wilcoxsign_test(Preparation_1 ~ Preparation_2, data=_) |>
  statistic(type="linear")
#Full output
Tobacco |>
  coin::wilcoxsign_test(Preparation_1 ~ Preparation_2, data=_)

# And our z statistic becomes .796 (notice -- pairs makes the N 8, not 16!)
Tobacco |>
  coin::wilcoxsign_test(Preparation_1 ~ Preparation_2, data=_) |> 
  purrr::pluck(statistic)/sqrt(8)


#########################
# Advanced Coding Notes #
#########################

########################
# A Deeper Exploration #
#.     Of the Pipe     #
#     And Using %$%    #
########################
# We have used |> as the base, default pipe throughout this course. And, we believe
# it is pedagogically useful (and future-forward thinking) to keep this in place.

# However, the |> comes from %>%, which is drawn from the individuals who created the tidyverse.

# There is small functionality in the differences between |> and %>%, and truly, 
# at this point of writing, %>% still has a few side-uses. Note: We use data=_, 
# but %>% requires us to say data=., (a period instead of an underscore).

# This then takes us one step further - the singular pipe focuses on passing one object --
# be it a dataset, a column, a row.

# But above - we've been trying to deal with two columns. Time 1 and Time 2.

# There is other versions of the pipe -- all housed in magrittr

#library(magrittr) / library(tidyverse)
Tobacco %$%
  wilcox.test(Preparation_1, Preparation_2, paired=TRUE)
Tobacco %$%
  rank_biserial(Preparation_1, Preparation_2, paired=TRUE)

Tobacco |> 
  tidyr::pivot_longer(cols= -Plant,
                      names_to="Measure", 
                      values_to="Value") %$%
  rcompanion::wilcoxonPairedRC(x = Value, g = Measure, verbose=TRUE)

# There is further discussion of the %$% operator here:
# https://stackoverflow.com/questions/71008076/should-i-use-instead-of

# But notice how what happens is the following:
# %$% eliminates the need to say data=_ or data=. 
# %$% enables the drawing of multiple columns from the left-hand side.
# Since we are no longer using Pair(), we need to state paired=TRUE.

# There are limitations to it - and we hesitate to put this forward to students for 
# a wide variety of reasons - but we did want to offer it as an option for students
# who wish to move forward further. 

##################################
# Code to Replicate Their Figure #
##################################

# Remember you can select all code that you want to uncomment and then Shift+Alt+C (Shift+Cmd+C for Macs).
# If you want to play around with this, re-load this Module at any time, quickly play(), 
# and see if you can improve the graph. We gave some of our own suggestions already.

# Selfies |>
#   # When pivoting, it's best if there are multiple DVs collected that the variables are 
#   # clearly demarcated by some symbol. I like _.
#   # rename() takes the new variable on the left and the old name on the right.
#   rename(Selfie_WeightAv = SelfieWeightAv,
#          Selfie_AttractAv = SelfieAttractAv,
#          Allo_WeightAv = AlloWeightAv,
#          Allo_AttractAv = AlloAttractAv) |>
#   pivot_longer(cols=-c(ParticipantNum, WeightDiff, AttractDiff),
#                # This part of ".value" is particularly important and looks to the _ to figure things out.
#                names_to = c("Condition", ".value"),
#                names_sep = "_",
#                values_to = "Value") |>
#   mutate(
#     Condition = case_when(
#       Condition=="Selfie" ~ "Selfie",
#       Condition=="Allo" ~ "Allocentric"
#     )
#   ) |>
#   ggplot(aes(x=Condition, y=WeightAv))+
#   geom_violin(aes(color=Condition),
#               trim=FALSE,
#               # We don't like the box that geom_violin creates in the legend. We'd get rid of it.
#               show.legend=FALSE)+
#   geom_point(aes(color=Condition),
#              position = position_jitter(width = .15),
#              size = 1.5,
#              alpha=.5 #We'd make the dots a bit less prominent and more seethrough.
#              )+
#   geom_boxplot(aes(color=Condition),
#                outlier.shape = NA,
#                alpha = 0.3,
#                width = .1
#                )+
#   scale_y_continuous(breaks=c(20, 40, 60),
#                      limits=c(20, 65))+
#   labs(
#     title= "Weight Ratings",
#     x = "Condition",
#     y = "Rating"
#   ) + 
#   # We don't like the default R colors. So, we'd edit them directly.
#   scale_color_manual(values=c("blue", "red"))+
#   jtools::theme_apa() #And of course, we'd include APA style!




saved <- "Y"
options(warn = oldw)