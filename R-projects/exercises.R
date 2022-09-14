#exercise 1 mass and metabolism 

size_mr_data <- data.frame(
  body_mass = c(32000, 37800, 347000, 4200, 196500, 100000, 4290, 
                32000, 65000, 69125, 9600, 133300, 150000, 407000, 115000, 
                67000,325000, 21500, 58588, 65320, 85000, 135000, 20500, 1613,
                1618),
  metabolic_rate = c(49.984, 51.981, 306.770, 10.075, 230.073, 
                     148.949, 11.966, 46.414, 123.287, 106.663, 20.619, 180.150, 
                     200.830, 224.779, 148.940, 112.430, 286.847, 46.347, 142.863, 
                     106.670, 119.660, 104.150, 33.165, 4.900, 4.865))
ggplot(size_mr_data, aes(x = body_mass, y = metabolic_rate)) +
  geom_point()


ggplot(size_mr_data, aes(x = body_mass, y = metabolic_rate)) +
  geom_point(size = 5, color = "turquoise") +
  scale_y_log10() +
  scale_x_log10()

#2 adult vs newborn 
mammal_lifehistories <- read.csv("http://esapubs.org/archive/ecol/E084/093/Mammal_lifehistories_v2.txt", sep = "\t", nrows = 1440, na.strings = c("-999", "-999.00"))


ggplot(mammal_lifehistories, aes(x = mass.g., y = newborn.g.)) +
  geom_point() +
  labs(x = "Mass (g)" , y = "Newborn Mass (g)", 
       title = "Week 5 - Ex 2 Graph") +
  scale_y_log10() +
  scale_x_log10()

ggplot(mammal_lifehistories, aes(x = mass.g., y = newborn.g., color=order)) +
  geom_point() +
  labs(x = "Mass (g)" , y = "Newborn Mass (g)", 
       title = "Week 5 - Ex 2 Graph") +
  scale_y_log10() +
  scale_x_log10() +
facet_wrap(~order) +
  geom_smooth(method = lm)
  

ggplot(mammal_lifehistories, aes(x = mass.g., y = newborn.g.)) +
  geom_point() +
  labs(x = "Mass (g)" , y = "Newborn Mass (g)", 
       title = "Week 5 - Ex 2 Graph") +
  scale_y_log10() +
  scale_x_log10() +
  facet_wrap(~order) +
  geom_smooth(method = lm) 
#easier to see the line wihtout color points 

#exercise 3 sexual dimorphism 

 bird_sizes<- read.csv("http://www.esapubs.org/archive/ecol/E088/096/avian_ssd_jan07.txt", sep = "\t", na.strings = c(-999, -999.0))

 ggplot(bird_sizes, aes(x=F_mass)) +
   geom_histogram(fill="blue") +
   labs(x = "Female Mass (g)") +
   scale_x_log10()
  
 #overlayed male data with transparent data, so I can see both
 ggplot(bird_sizes, aes(x=F_mass)) +
   geom_histogram(fill="blue", alpha = 0.3) +
   labs(x = "Mass (g)") +
   scale_x_log10()+
   geom_histogram(aes(x=M_mass), alpha=0.3)
 
 #adding subplots of 
 ggplot(bird_sizes, aes(x=F_mass)) +
   geom_histogram(fill="blue") +
   labs(x = "Mass (g)") +
   scale_x_log10() +
   geom_histogram(aes(x=M_mass), alpha=0.3) +
   facet_wrap(~Family)
 
 
#using wingsize instead of mass
 ggplot(bird_sizes, aes(x=M_wing)) +
   geom_histogram() +
   labs(x = "wingsize") +
   scale_x_log10() +
   geom_histogram(aes(x=M_mass), alpha=0.3) +
   facet_wrap(~Family)
 
 #4 exercise sexual dimorphism manipulation
 #taking all the families and summarizing it by the count of each species 
 #then we use filter to get families that have more than 25 species in the data 
 
 
 large_n_families <- bird_sizes %>%
   filter(!is.na(M_mass), !is.na(F_mass)) %>%
   group_by(Family) %>%
   summarize(num_species = n()) %>%
   filter(num_species > 25)
 
new_species_data <- inner_join(bird_sizes, large_n_families, by = "Family")

ggplot(new_species_data, aes(x=M_wing)) +
  geom_histogram() +
  labs(x = "wingsize") +
  scale_x_log10() +
  geom_histogram(aes(x=M_mass), alpha=0.3) +
  facet_wrap(~Family)


#mutating

new_table <- mutate(new_species_data, relative_size_difference = ((F_mass - M_mass) / F_mass))

ggplot(new_table, aes(x=relative_size_difference)) +
  geom_histogram() +
labs(x = "relative mass (g)") +
  geom_smooth(method = lm)

#zip a file. go into laptop where project is in documeties, week 5. fin ddirectory. right click on mac, then compress on the pull down bar, then it creates a new file 




