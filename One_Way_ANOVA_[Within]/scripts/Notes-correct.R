#Notes for 1 Way Repeated Measure
library(datarium) # For example data
library(tidyr) # For pivoting example data
selfest_long <- 
  selfesteem2 |>
  # Reference the pivoting data module to understand this piece of code.
  pivot_longer(cols=-c(id, treatment), names_to="Time", values_to="SelfEsteem") |>
  filter(treatment!="Diet")

###########################
# Repeated Measures ANOVA #
###########################
library(rstatix)
# Step 1: Run the ANOVA. Check Mauchley's Test. 
selfest_long |>
  anova_test(dv=SelfEsteem, within=Time, wid=id, effect.size = "ges")

# Step 2: If significant, check sphericity output. (This example p>.05, but for notes purposes):

# Step 3: If GGe or HFe > .75, use correction="HF". If GGe or HFe <.75, use correction="GG".

selfest_long |>
  anova_test(dv=SelfEsteem, within=Time, wid=id, effect.size = "ges") |>
  get_anova_table(correction="none") # None because p>.05

###########################
# Repeated Measures ANOVA #
# Using Random Effects    #
###########################
library(lmerTest)
selfest_long |>
  lmer(SelfEsteem ~ Time + (1|id), data=_) |>
  anova()

# We do not utilize this for the anova() itself because it does not provide
# the assumption tests. However, we find it helpful to use this approach
# in the post-hoc tests for estimated marginal means purposes as well as 
# plotting purposes.

############################
# Analyzing Post-Hoc Tests #
############################
#############
# emmeans() #
#############
library(lmerTest) # For modeling
library(emmeans) # For post-hocs
# Our main recommendation is through the emmeans() package, because it provides the
# ability to consider interactions when we move into factorial within-subjects.
# It also provides the p-values reported in the example text, another point for this 
# approach.

# We support this approach additional reasons - more complex models will introduce 
# control variables, and that is where the estimated marginal mean comparisons shine.
selfest_long |>
  lmerTest::lmer(SelfEsteem ~ Time + (1|id), data=_) |> # Model run.
  emmeans(~Time) |> # Use emmeans() to get estimated marginal means for each time.
  pairs() # Do pairwise t-tests.

############
# t_test() #
############
# You could consider using t_test()/pairwise_t_test() in rstatix.
# We note that the rstatix package's blog it recommends this approach, especially
# when we get to factorial repeated measures.
# https://www.datanovia.com/en/lessons/repeated-measures-anova-in-r/
# However, such an approach fails to consider all comparisons. 
library(rstatix)
selfest_long |>
  t_test(SelfEsteem ~ Time,
         paired=TRUE)

###############################
# Effect Size For Paired Data #
###############################
# We note the same discussion of repeated measures effect sizes that we held in 
# paired t-test hold here and that all of those references should be noted. 
library(rstatix)
selfest_long |>
  cohens_d(SelfEsteem ~ Time, paired=TRUE)

#############################
# Citations for this module #
#############################
# Abdi, H. (2010). The greenhouse-geisser correction. In N. Salkind (Ed.), Encyclopedia of research design (pp. 1–10). Sage.
# Bakeman, R. (2005). Recommended effect size statistics for repeated measures designs. Behavior Research Methods, 37(3), 379–384. https://doi.org/10.3758/BF03192707
# Haverkamp, N., & Beauducel, A. (2017). Violation of the Sphericity Assumption and Its Effect on Type-I Error Rates in Repeated Measures ANOVA and Multi-Level Linear Models (MLM). Frontiers in Psychology, 8, 1841. https://doi.org/10.3389/fpsyg.2017.01841
# Lakens, D. (2013). Calculating and reporting effect sizes to facilitate cumulative science: A practical primer for t-tests and ANOVAs. Frontiers in Psychology, 4. https://doi.org/10.3389/fpsyg.2013.00863


# Don't delete me!
saved <- "Y"