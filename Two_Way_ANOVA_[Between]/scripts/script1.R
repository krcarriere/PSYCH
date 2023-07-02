# Create an object called Contrast_List . 

# Set that object equal to list().

# We will have list( have four lines of values. )

# I have done the first one for you - since I want to compare 
# [Eastbound Spadina] against [Westbound Spadina], and I do not want to compare any of 
# the others, I set one of them equal to -1 (Eastbound Spadina) and one equal to 1 (Westbound Spadina).

# We want to repeat the same thing for StGeorge, BloorYonge, and Sherbourne.
# Where we want to say for StGeorge, just compare East to West.
# To make this work smoothly, let's always call Eastbound -1 and Westbound 1. 
Contrast_List = list(Spadina = c(-1, 1, 0, 0, 0, 0, 0, 0),
                     StGeorge = c(),
                     BloorYonge = c(),
                     Sherbourne = c()
                     )

