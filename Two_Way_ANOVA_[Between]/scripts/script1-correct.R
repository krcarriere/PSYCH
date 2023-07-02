# Create an object called Contrast_List . 

# Set that object equal to list().

# We will have list( have four lines of values. )

# I have done the first one for you - since I want to compare 
# [Eastbound Spadina] against [Westbound Spadina], and I do not want to compare any of 
# the others, I set one of them equal to -1 (Eastbound Spadina) and one equal to 1 (Westbound Spadina).

# We want to repeat the same thing for StGeorge, BloorYonge, and Sherbourne.
Contrast_List = list(Spadina = c(-1, 1, 0, 0, 0, 0, 0, 0),
                     StGeorge = c(0, 0, -1, 1, 0, 0, 0, 0),
                     BloorYonge = c(0, 0, 0, 0, -1, 1, 0, 0),
                     Sherbourne = c(0, 0, 0, 0, 0, 0, -1, 1)
                     )