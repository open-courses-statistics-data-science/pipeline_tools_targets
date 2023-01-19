
clean_data <- function(filename) {
  df <- read.csv(filename)
  
  df %>% 
    rename_all(tolower) %>% 
    filter(!is.na(ozone))
}