# Notes for 2-Way Within ANOVA

library(rstatix)
## Primarily using anova_test()
data("selfesteem2", package = "datarium")

## Ideally, our data is in the long style.
library(tidyr)
self_long <- selfesteem2 |>
  tidyr::pivot_longer(cols=c(t1,t2,t3),
                      names_to="Time",
                      values_to = "se_score")

library(dplyr)
# Assumption of Normality Within Groups
self_long |> 
  group_by(treatment, Time) |>
  shapiro_test(se_score)

# Biology-based textbooks may suggest testing to see if a data transformation helps.
# Psychology has rarely utilized transformations of response variables, but we 
# also are rather poor at checking assumptions.

# If you wanted to transform, use mutate().
self_long <-
  self_long |>
  mutate(
    logSE = log(se_score)
  )

self_long |>
  group_by(treatment, Time) |>
  shapiro_test(logSE)
# But in our example, it actually gets worse. So, opt to not.

################
# anova_test() #
################
# For repeated measures ANOVAs, use anova_test() and use the arguments.
# dv = dependent / response variable.
# within = a list of within-subjects variables.
# between = a list of between-subjects variables.
# wid = the variable that represents each individual person.
self_long |> 
  anova_test(dv = se_score,
             within = c(Time, treatment),
             wid = id)

##################
# Mauchly's Test #
# for Sphericity #
##################

# Look for any p<.05
# Note that Sphericity can only be violated if the levels > 2.
# Since this example there's only two treatments, it does not show up (it can't be violated).

# Since it is significant, we should correct.
# We look at GGe for Time and HEe for Time. If either is less than .75, we should use GG.
# Since both are less than .75, we should correct with GG corrections.

# The corrections adjust the degrees of freedom, which will adjust the F Critical.
# It makes it harder to reject the null.
###############
# Corrections #
###############
self_long |> 
  anova_test(dv = se_score,
             within = c(Time, treatment),
             wid = id) |>
  get_anova_table(correction="GG")


#######################
# Partial Eta Squared #
#######################
library(apaTables)
# Given F.value, df1, df2, and a conf.level, you can get a partial eta squared. 

get.ci.partial.eta.squared(27.369, df1=1.31, df2=14.37, conf.level=.90)


#####################
# Repeated Measures #
# As Random Effects #
#####################
# There is a second method to do repeated measures.
# This method cannot adjust for sphericity, but does provide output that can be:
# (a) tested using pairwise comparisons
# (b) plotted easily as estimated marginal means.
# You just treat the subject as a random effect.
# Everything that we learned in One Way ANOVA [Between] then applies for coding purposes.

# ANOVA Output
library(lmerTest)
self_long |>
  lmer(se_score ~ Time*treatment + (1|id), data=_) |>
  anova()

# Pairwise Comparisons
library(emmeans)
self_long |>
  lmer(se_score ~ Time*treatment + (1|id), data=_) |>
  emmeans(~Time) |>
  pairs()

# Compact Letter Display
library(multcompView)
self_long |>
  lmer(se_score ~ Time*treatment + (1|id), data=_) |>
  emmeans(~Time) |>
  cld(Letters=letters)

# Plotting The Means
library(dplyr)
library(ggplot2)
self_long |>
  lmer(se_score ~ Time*treatment + (1|id), data=_) |>
  emmeans(~Time*treatment) |>
  cld(Letters=letters) |>
  mutate(
    .group=gsub(" ", "", .group)
  ) |> 
  # This code is set for 2 factor plotting.
  # For one factor, Check x= and group=, fill=.
  ggplot(aes(x=Time, y=emmean, group=treatment, label=.group))+
  geom_col(position="dodge", colour="black", aes(fill=factor(treatment)))+
  scale_fill_manual(values=c("grey40", "grey", "grey100"))+
  labs(y="Self Esteem Score", x="Time", fill="")+
  theme(plot.title = element_text(hjust = 0.5)) + 
  geom_errorbar(aes(ymin=emmean-SE, ymax=emmean+SE),
                width=.3,
                position=position_dodge(.9))+
  # Adjust here for letter height
  geom_text(aes(y=emmean+10), 
            position=position_dodge(width=.9))

saved <- "Y"