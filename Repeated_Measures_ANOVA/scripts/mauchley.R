            # What is the name of our dataset?
pwh_anova <- _____ |>
            # What is our dependent variable (DV) or as we have been calling it,
            # our response variable?
  anova_test(dv=____,
             # What is our within-subjects ID, or wid? What is our variable for
             # identifying each participant?
             wid=_____,
             # For within, give the two within-subjects groups: PayLevel and PayForm.
             # In practice, it doesn't matter the order, but for this module,
             # It does, so please put it in the order we outline.
             within=c(_____, _____))