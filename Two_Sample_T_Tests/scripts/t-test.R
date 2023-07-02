# Choose one of the four variables to predict if 
# differences exist between active and frozen goals.

#achieve.goal.importance - How important is it to achieve this goal?
#progress - How much progress have you made on this goal?
#have.goal.importance - How important is it to have this goal?
#difficult.achieve - How difficult is it to achieve this goal? 

REPLACE_Results <- #Replace with your choice of "Achieve", "Progress", "Have", or "Difficult"
  NameOfData |> #replace with goalsdf
  t.test(ResponseVariable ~ GroupingVariable, # Choose from one of the list above. Our Grouping Variable is condition
         data =  ) # What character do we place here to represent the left-hand side pipe again? (_) 

# In the end, your result should be saved as one of the following:
#Achieve_Results, Progress_Results, Have_Results, or Difficult_Results