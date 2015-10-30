# this analysis is conducted for H. Granger, anlayzing the GC content by ear length for house elves

# import the data
get_data <- function(){
  data <- read.csv(file = "data/houseelf_earlength_dna_data.csv")
  return(data)
}

data <-get_data()
