# Choose one of the four variables.

Achieve_Results <- 
  goalsdf |> 
  t.test(achieve.goal.importance ~ condition, 
         data = _ ) 

Progress_Results <- 
  goalsdf |> 
  t.test(progress ~ condition, 
         data = _ ) 

Have_Results <-
  goalsdf |> 
  t.test(have.goal.importance ~ condition, 
         data = _ ) 


Difficult_Results <- 
  goalsdf |> 
  t.test(difficult.achieve ~ condition, 
         data = _ ) 