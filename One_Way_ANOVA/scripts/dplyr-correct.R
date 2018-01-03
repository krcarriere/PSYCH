sum_data <- data %>% group_by(Species) %>% summarize(N = sum(!is.na(Petal.Length)), 
                                                     Mean = mean(Petal.Length, na.rm=TRUE),
                                                     SD = sd(Petal.Length, na.rm=TRUE),
                                                     SE = SD/sqrt(N))


