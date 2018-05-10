#Two Sample T Tests

lesson_dir <- file.path(path.package("swirl"), "Courses",
                        "Psychology_Statistics", "Two_Sample_T_Tests")

image1 <- file.path(lesson_dir, "twosamplet-test.png")
datapath1 <- file.path(lesson_dir, "Schroeder and Epley 2015 Study 4 data.csv")
datapath2 <- file.path(lesson_dir, "Zhang et al. 2014 Study 3.csv")

twosamplettest  <- readbitmap::read.bitmap(image1)
data <- read.csv(datapath1)

data$gender <- as.factor(data$gender)
data$gender <- plyr::revalue(data$gender, c("1"="Male", "2"="Female"))

data <-  data[ , !names(data) %in% c("compt", "thought",
                                     "intell", "like",
                                     "pos", "neg",
                                     "hire", "intellect",
                                     "time", "wordcount",
                                     "impression", "speaker",
                                     "negR", "centhire",
                                     "centintellect", "centimpression",
                                     "meanintellect", "meanimpression", 
                                     "meanhire"
                                     )]
data <- dplyr::rename(data, condition = CONDITION)
data$condition <- as.factor(data$condition)
data$condition <- plyr::revalue(data$condition, c("0"="Transcript", "1"="Audio"))

data2 <- read.csv(datapath2)
data2$participantid <- seq.int(nrow(data2))
data2 <- data2[ , !names(data2) %in% c("T1_Predicted_Interest_Composite", 
                                    "T2_Actual_Interest_Composite", "T2_Detailed", 
                                    "T2_Memory", "Amount_Underestimated_Interest", 
                                    "T1_Ord_PredT2_Curious", "T1_Ord_PredT2_Enjoy", 
                                    "T1_Ord_PredT2_Interesting", "T1_Ord_PredT2_Meaningful", 
                                    "T1_Ord_PredT2_Surprise", "T1_Ord_Extra", 
                                    "T1_Extra_PredT2_Curious", "T1_Extra_PredT2_Enjoy", 
                                    "T1_Extra_PredT2_Interesting", "T1_Extra_PredT2_Meaningful", 
                                    "T1_Extra_PredT2_Surprise", "T1_Extra_Extraord", 
                                    "T2_Enjoy", "T2_Meaningful", 
                                    "T2_Surprise", "T2_Interesting", 
                                    "T1_Predicted_Interesting", "Predicted_Enjoy", 
                                    "Predicted_Meaningful", "Predicted_Surprise", 
                                    "Year", 
                                    "filter_.", 
                                    "YOUNG.OLD")]
