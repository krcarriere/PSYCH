new_data <- plyr::ddply(data, 
                        c("directionf", "stationname"), 
                        summarise, 
                        N = sum(!is.na(subjective_distance)))
