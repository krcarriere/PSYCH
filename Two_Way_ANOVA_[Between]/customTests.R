# Put custom tests in this file.
      
      # Uncommenting the following line of code will disable
      # auto-detection of new variables and thus prevent swirl from
      # executing every command twice, which can slow things down.
      
      # AUTO_DETECT_NEWVAR <- FALSE
      
      # However, this means that you should detect user-created
      # variables when appropriate. The answer test, creates_new_var()
      # can be used for for the purpose, but it also re-evaluates the
      # expression which the user entered, so care must be taken.

test_fib <- function() {
  try({
    func <- get('fib', globalenv())
    t1 <- identical(func(1), 1)
    t2 <- identical(func(20), 6765)
    t3 <- identical(sapply(1:12, func), c(1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144))
    ok <- all(t1, t2, t3)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}


script_results_identical <- function(result_name) {
  # Get e
  e <- get('e', parent.frame())
  # Get user's result from global
  if(exists(result_name, globalenv())) {
    user_res <- get(result_name, globalenv())
  } else {
    return(FALSE)
  }
  # Source correct result in new env and get result
  tempenv <- new.env()
  # Capture output to avoid double printing
  temp <- capture.output(
    local(
      try(
        source(e$correct_script_temp_path, local = TRUE),
        silent = TRUE
      ),
      envir = tempenv
    )
  )
  correct_res <- get(result_name, tempenv)
  # Compare results
  identical(user_res, correct_res)
}

graph_results_identical <- function(result_name) {
  # Get e
  e <- get('e', parent.frame())
  # Get user's result from global
  if(exists(result_name, globalenv())) {
    user_res <- get(result_name, globalenv())
  } else {
    return(FALSE)
  }
  # Source correct result in new env and get result
  tempenv <- new.env()
  # Capture output to avoid double printing
  temp <- capture.output(
    local(
      try(
        source(e$correct_script_temp_path, local = TRUE),
        silent = TRUE
      ),
      envir = tempenv
    )
  )
  correct_res <- get(result_name, tempenv)
  # Compare results
  all.equal(user_res, correct_res)
}


script_results_data <- function(result_name, data_file, round_numeric_columns = FALSE){
  # Get user's result from global
  if(exists(result_name, globalenv())) {
    user_res <- get(result_name, globalenv())
  } else {
    return(FALSE)
  }
  correct_res <- readRDS(.pathtofile(data_file))
  # If specified, round any numeric columns to one digit before comparing
  if(round_numeric_columns){
    is.num <- sapply(user_res, is.numeric)
    user_res[is.num] <- lapply(user_res[is.num], round, 1)
    is.num <- sapply(correct_res, is.numeric)
    correct_res[is.num] <- lapply(correct_res[is.num], round, 1)
  }
  # Compare results
  identical(user_res, correct_res)
}

script_results_data3 <- function(result_name, data_file1, data_file2, data_file3,
                                 round_numeric_columns = FALSE){
  script_results_data(result_name, data_file1, round_numeric_columns) ||
    script_results_data(result_name, data_file2, round_numeric_columns) ||
    script_results_data(result_name, data_file3, round_numeric_columns)
}

keygen <- function(){
  set.seed(sum(as.numeric(charToRaw("Data_Manipulation"))))
  pran <- function(n = 1){
    replicate(n, sample(c(LETTERS, letters, 0:9), 1))
  }
  ks <- replicate(4, paste0(pran(4), collapse = ""))
  set.seed(NULL)
  pn <- sample(1:16, 1)
  kn <- sample(1:4, 1)
  sss <- paste(sample(c(LETTERS, letters, 0:9), 16-pn), collapse = "")
  eee <- paste(sample(c(LETTERS, letters, 0:9), pn), collapse = "")
  paste0(sss, ks[kn], eee)  
}

# Get the swirl state
getState <- function(){
  # Whenever swirl is running, its callback is at the top of its call stack.
  # Swirl's state, named e, is stored in the environment of the callback.
  environment(sys.function(1))$e
}

# Get the value which a user either entered directly or was computed
# by the command he or she entered.
getVal <- function(){
  getState()$val
}

# Get the last expression which the user entered at the R console.
getExpr <- function(){
  getState()$expr
}

# Retrieve the log from swirl's state
getLog <- function(){
  getState()$log
}

submit_log <- function(){
  selection <- getState()$val
  if(selection == "Yes"){
    # Please edit the link below
    pre_fill_link <- "https://docs.google.com/forms/d/e/1FAIpQLSd06zKFsAzoVtUIWedATgqqvHYPvuRk3SjfsXb8Jl-8TFEBQg/viewform?usp=pp_url&entry.616068391&entry.103661786"
    
    # Do not edit the code below
    if(!grepl("=$", pre_fill_link)){
      pre_fill_link <- paste0(pre_fill_link, "=")
    }
    
    p <- function(x, p, f, l = length(x)){if(l < p){x <- c(x, rep(f, p - l))};x}
    
    temp <- tempfile()
    log_ <- getLog()
    nrow_ <- max(unlist(lapply(log_, length)))
    log_tbl <- data.frame(user = rep(log_$user, nrow_),
                          course_name = rep(log_$course_name, nrow_),
                          lesson_name = rep(log_$lesson_name, nrow_),
                          question_number = p(log_$question_number, nrow_, NA),
                          correct = p(log_$correct, nrow_, NA),
                          attempt = p(log_$attempt, nrow_, NA),
                          skipped = p(log_$skipped, nrow_, NA),
                          datetime = p(log_$datetime, nrow_, NA),
                          stringsAsFactors = FALSE)
    write.csv(log_tbl, file = temp, row.names = FALSE)
    encoded_log <- caTools::base64encode(temp)
    browseURL(paste0(pre_fill_link, encoded_log))
  }
}

submit_log_two <- function(){
  selection <- getState()$val
  if(selection == "Yes"){
    # Please edit the link below
    pre_fill_link <- "https://docs.google.com/forms/d/e/1FAIpQLSfG7Id-Toaw4HONW28ODtjVUHDvLUIGJFaddOCriE8K62N2SQ/viewform?usp=pp_url&entry.1487757760"
    
    # Do not edit the code below
    if(!grepl("=$", pre_fill_link)){
      pre_fill_link <- paste0(pre_fill_link, "=")
    }
    
    p <- function(x, p, f, l = length(x)){if(l < p){x <- c(x, rep(f, p - l))};x}
    
    temp <- tempfile()
    log_ <- getLog()
    nrow_ <- max(unlist(lapply(log_, length)))
    log_tbl <- data.frame(user = rep(log_$user, nrow_),
                          course_name = rep(log_$course_name, nrow_),
                          lesson_name = rep(log_$lesson_name, nrow_),
                          question_number = p(log_$question_number, nrow_, NA),
                          correct = p(log_$correct, nrow_, NA),
                          attempt = p(log_$attempt, nrow_, NA),
                          skipped = p(log_$skipped, nrow_, NA),
                          datetime = p(log_$datetime, nrow_, NA),
                          stringsAsFactors = FALSE)
    write.csv(log_tbl, file = temp, row.names = FALSE)
    encoded_log <- caTools::base64encode(temp)
    browseURL(paste0(pre_fill_link, encoded_log))
  }
}
