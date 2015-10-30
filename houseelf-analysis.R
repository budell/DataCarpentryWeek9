# this analysis is conducted for H. Granger, anlayzing the GC content by ear length for house elves
library(stringr)
library(dplyr)

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


get_size_class <- function(seq){
   #Calculate the GC-content for one or more sequences
   ear_lengths <- ifelse(seq > 10, "large", "small")
   return(ear_lengths)
}


### here is a code the uses the functions to import the data, get the ear class, calculat the gc content
# for each individual, selects the relevant collumns, and saves it as a .csv file in the output folder
data <-get_data()

data_ear_class <- data %>% 
  mutate(ear_class = get_size_class(earlength))


data_ear_gc <- data_ear_class  %>% 
  mutate(GC = calc_gc(dnaseq))


data_store <- data_ear_gc %>%
  select(id,ear_class,GC)

write.csv(data_store,"output/grangers_analysis.csv")

