# this analysis is conducted for H. Granger, anlayzing the GC content by ear length for house elves
library(stringr)

# import the data
get_data <- function(){
  data <- read.csv(file = "data/houseelf_earlength_dna_data1.csv")
  return(data)
}

data <-get_data()


#function to calculate gc content in upper or lower case, and vectorized

calc_gc <- function(sequence){
  #this function uses stringr to calculat the G or C content of a DNA string 
  Gs <- str_count(sequence, ('G')) + str_count(sequence, ('g'))
  Cs <- str_count(sequence, ('C')) + str_count(sequence, ('c'))
  gc_content <- (Gs + Cs) / str_length(sequence) * 100 
  return(gc_content)
}


