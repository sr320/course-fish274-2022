surveys <- read.csv("data/surveys.csv")




select(surveys, year, month, day)





filter(surveys, species_id == "DS", year > 1995)


filter(surveys, species_id == "DS" | species_id == "DM")


mutate(surveys, hindfoot_length_cm = hindfoot_length / 10)



#Now onto Aggregation!!!


surveys_by_species <- group_by(surveys, species_id)

summarize(surveys_by_species, avg_weight = mean(weight))

summarize(surveys_by_species, avg_weight = mean(weight, na.rm=TRUE))


#JOINS!

species <- read.csv("data/species.csv")



combined <- inner_join(surveys, species, by = "species_id")


head(combined)

#Pipes!!!

surveys_DS <- filter(surveys, species_id == "DS")
surveys_DS_by_yr <- group_by(surveys_DS, year)
avg_weight_DS_by_yr <- summarize(surveys_DS_by_yr,
                                 avg_weight = mean(weight, na.rm=TRUE))



surveys %>%
  filter(species_id == "DS") %>%
  group_by(year) %>%
  summarize(avg_weight = mean(weight, na.rm=TRUE))



