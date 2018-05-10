new_data <- plyr::ddply(data, 
                        c("directionf", "stationname"), 
                        summarise, 
                        N = sum(!is.na(subjective_distance)),
                        Mean = mean(subjective_distance, na.rm=TRUE),
                        SD = sd(subjective_distance, na.rm=TRUE),
                        SE = SD/sqrt(N)
                        )
