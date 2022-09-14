
#Working with Tablular data


install.packages("dplyr")

library("dplyr")



surveys <- read.csv("data/surveys.csv")

surveys

select(surveys, year, month, day)

filter(surveys, species_id == "DS")


filter(surveys, species_id == "DS", year > 1995)


filter(surveys, species_id == "DS" | species_id == "DM")



mutate(surveys, hindfoot_length_cm = hindfoot_length / 10)

summarize(surveys_by_species, avg_weight = mean(weight, na.rm=TRUE))





#Aggregations

group_by(surveys, species_id)


surveys_by_species <- group_by(surveys, species_id)





#joins

species <- read.csv("data/species.csv")

combined <- inner_join(surveys, species, by = "species_id")






surveys %>%
  filter(species_id == "DS") %>%
  group_by(year) %>%
  summarize(avg_weight = mean(weight, na.rm=TRUE))




