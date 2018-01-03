#Write using the ddply() function from the plyr package.
#ddply takes many arguments. First, it takes the name of the dataset.
#Second, it takes a concatenation of strings (so we need ""!) of variables we want to put into groups.
#That would be things like, did they take the drug, or not? It is our independent variables.
#Third, it takes the word summarise (it is the method we'll be using).
#Finally, it takes new variable names, and functions to calculate them.
#We'll call the first new variable N, and set it equal to the sum(!is.na()), and put our DV inside of that function.
#This will simply count up the number of observations per group. 

#I've set everything up for you. 
#We want to summarise our dataset on subjective_distance by the factors directionf and stationname.
#Using the information provided, change all 6 inputs necessary to make this command work.

#Finally, save this to a variable called new_data.

#When you are done, new_data should, if you ever call it, look like this:
# directionf stationname  N
#1 Traveling East     Spadina 26
#2 Traveling East   St.George 26
#3 Traveling East Bloor-Yorne 23
#4 Traveling East  Sherbourne 26
#5 Traveling West     Spadina 25
#6 Traveling West   St.George 25
#7 Traveling West Bloor-Yorne 26
#8 Traveling West  Sherbourne 25

variablename <- packagename::functionname(nameofdataset, 
                          c("VARIABLEONE", "VARIABLETWO"), 
                          summarise, 
                          N = sum(!is.na(DEPENDENTVARIABLE))
                          )

