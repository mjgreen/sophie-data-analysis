library(tidyverse)
allfiles=list.files("data", full.names = TRUE)

combined_files=tibble()

for (f in 1:length(allfiles)) {
  this_file <- read_csv(allfiles[f],show_col_types = FALSE)
  this_file <- 
    this_file %>% 
    filter(phase == "experimental") %>% 
    filter(key_resp.corr == 1) %>% 
    select(participant,Stimulus, Type, the_font, key_resp.corr, key_resp.rt)
  combined_files <- bind_rows(combined_files, this_file)
}

write_csv(x=combined_files,file="combined_data.csv")