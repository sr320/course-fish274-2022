
library(ggplot2)
library(dplyr)


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
  geom_point() +
  labs(x = "Body Mass", y = "Metabolic Rate",
       title = "Week 5 - Ex 1 Graph")


ggplot(size_mr_data, aes(x = body_mass, y = metabolic_rate)) +
  geom_point(size = 5, alpha = 0.5) + 
  scale_y_log10() +
  scale_x_log10() +
  labs(x = "Body Mass", y = "Metabolic Rate",
       title = "Week 5 - Ex 1 Graph")

----
Mammal_life <- read.csv("https://esapubs.org/archive/ecol/E084/093/Mammal_lifehistories_v2.txt", sep="\t", nrows = 1440, na.strings = c("-999", "-999.00"))

#trying the second link for the data. 
Mammal_est <- read.csv("http://gannet.fish.washington.edu/seashell/snaps/Mammal_lifehistories_v2.txt", sep="\t", nrows = 1440, na.strings = c("-999", "-999.00"))

http://gannet.fish.washington.edu/seashell/snaps/Mammal_lifehistories_v2.txt



   
Mammal_lif <- read.csv("data/Mammal_lifehistories_v2.txt", sep="\t", nrows = 1440, na.strings = c("-999", "-999.00"))


ggplot(Mammal_lif, aes(x = mass.g., y = newborn.g.)) +
  geom_point() +
  labs(x = "Mass (g)", y = "Newborn Mass (g)",
       title = "Week 5 - Ex 2 Graph")


#It looks like there’s a regular pattern here, but it’s definitely not linear. Let’s see if log-transformation straightens it out. Graph adult mass vs. newborn mass, with both axes scaled logarithmically. Label the axes.


ggplot(Mammal_lif, aes(x = mass.g., y = newborn.g.)) +
  geom_point() +
  scale_y_log10() +
  scale_x_log10() +
  labs(x = "Mass (g)", y = "Newborn Mass (g)",
       title = "Week 5 - Ex 2 Graph")

#This looks like a pretty regular pattern, so you wonder if it varies among different groups. Graph adult mass vs. newborn mass, with both axes scaled logarithmically, and the data points colored by order. Label the axes.

ggplot(Mammal_lif, aes(x = mass.g., y = newborn.g., color = order)) +
  geom_point() +
  scale_y_log10() +
  scale_x_log10() +
  labs(x = "Mass (g)", y = "Newborn Mass (g)",
       title = "Week 5 - Ex 2 Graph")



#Coloring the points was useful, but there are a lot of points and it’s kind of hard to see what’s going on with all of the orders. Use facet_wrap to create subplot for each order.


ggplot(Mammal_lif, aes(x = mass.g., y = newborn.g., color = order)) +
  geom_point() +
  scale_y_log10() +
  scale_x_log10() +
  facet_wrap(~order)
  labs(x = "Mass (g)", y = "Newborn Mass (g)",
       title = "Week 5 - Ex 2 Graph")

  
ggplot(Mammal_lif, aes(x = mass.g., y = newborn.g.)) +
    geom_point() +
    scale_y_log10() +
    scale_x_log10() +
    facet_wrap(~order)
  labs(x = "Mass (g)", y = "Newborn Mass (g)",
       title = "Week 5 - Ex 2 Graph")

#  Now let’s visualize the relationships between the variables using a simple linear model. Create a new graph like your faceted plot, but using geom_smooth to fit a linear model to each order. You can do this using the optional argument method = "lm" in geom_smooth.  
  
  ggplot(Mammal_lif, aes(x = mass.g., y = newborn.g.)) +
    geom_point() +
    geom_smooth(method = lm) +
    scale_y_log10() +
    scale_x_log10() +
    facet_wrap(~order) +
  labs(x = "Mass (g)", y = "Newborn Mass (g)",
       title = "Week 5 - Ex 2 Graph")
  
  
  
#  -- Sexual Dimorphism Exploration --
  
avian <- read.csv("data/avian_ssd_jan07.txt", sep="\t", na.strings = c("-999", "-999.0"))


data_birds <- read.csv("https://www.esapubs.org/archive/ecol/E088/096/avian_ssd_jan07.txt",sep ="\t",na.strings = c("-999", "-999.00"))

ggplot(data = data_birds) +
  geom_histogram(aes(x = F_mass)) +
  labs(x = "Female Mass (g)")

ggplot(data = data_birds) +
  geom_histogram(aes(x = F_mass), fill = 'blue')+
  labs(x = "Female Mass (g)")+
  scale_x_log10()


ggplot(avian, aes(x = F_mass)) +
  geom_histogram() +
  labs(x = "Female Mass(g)")


#A few really large masses dominate the histogram so create a log10 scaled version. Change the x axis label to "Female Mass(g)" and the color of the bars to blue (using the fill = "blue" argument).


ggplot(avian, aes(x = F_mass)) +
  geom_histogram(fill = "blue") +
  scale_x_log10() +
  labs(x = "Female Mass(g)")


#Now let’s add the data for male birds as well. Create a single graph with histograms of both female and male body mass. Due to the way the data is structured you’ll need to add a 2nd geom_histogram() layer that specifies a new aesthetic. To make it possible to see both sets of bars you’ll need to make them transparent with the optional argument alpha = 0.3.


ggplot() +
  geom_histogram(data = avian, aes(x = M_mass), fill = "blue", alpha = 0.3) +
  geom_histogram(data = avian, aes(x = F_mass), fill = "green", alpha = 0.3) +
  scale_x_log10() +
  labs(x = "Mass(g)")


#These distributions seem about the same, but this is all birds together so it might be difficult to see any patterns. Use facet_wrap() to make one subplot for each family.

ggplot() +
  geom_histogram(data = avian, aes(x = M_mass), fill = "blue", alpha = 0.3) +
  geom_histogram(data = avian, aes(x = F_mass), fill = "yellow", alpha = 0.3) +
  scale_x_log10() +
  facet_wrap(~Family) +
  labs(x = "Mass(g)")


#Make the same graph as in the last task, but for wing size instead of mass. Do you notice anything strange? If so, you may have gotten caught by the use of non-standard null values. If you already noticed and fixed this, Nice Work! If not, you can use the optional na.strings = c(“-999”, “-999.0”) argument in read.csv() to tell R what value(s) indicated nulls in a dataset.

ggplot() +
  geom_histogram(data = avian, aes(x = M_wing), fill = "blue", alpha = 0.3) +
  geom_histogram(data = avian, aes(x = F_wing), fill = "yellow", alpha = 0.3) +
  scale_x_log10() +
  facet_wrap(~Family) +
  labs(x = "Wing Size")

#QUESTION 4
#-- Sexual Dimorphism Data Manipulation --


library(dplyr)

#done aboave
avian <- read.csv("data/avian_ssd_jan07.txt", sep="\t", na.strings = c("-999", "-999.0"))



#this code creates a data frame with a column of Family IDs and a column of the number of species in the associated family that have non-null masses for both males and females and only includes families with more than 25 species
large_n_families <- avian %>%
  filter(!is.na(M_mass), !is.na(F_mass)) %>%
  group_by(Family) %>%
  summarize(num_species = n())  %>%
  filter(num_species > 25)


large_n_families


#Now join this with your original data to get the subset of your data with more than 25 species in each family. inner_join() only keeps rows where the joining field(s) occur in both tables, so since you’ve already removed families without a lot of species from large_n_families, they will be removed from the resulting data frame.


myjoin <- inner_join(avian, large_n_families, by = "Family")

#Now, remake your original graph using only the data on families with greater than 25 species.

ggplot() +
  geom_histogram(data = myjoin, aes(x = M_mass), fill = "blue", alpha = 0.3) +
  geom_histogram(data = myjoin, aes(x = F_mass), fill = "yellow", alpha = 0.3) +
  scale_x_log10() +
  facet_wrap(~Family) +
  labs(x = "Mass(g)")


#Sexual size dimorphism doesn’t seem to show up clearly when visually comparing the distributions of male and female masses across species. Maybe the differences among species are too large relative to the differences between sexes to see what is happening; so, you decide to calculate the difference between male and female masses for each species and look at the distribution of those values for all species in the data.

#In the original data frame, use mutate() to create a new column which is the relative size difference between female and male masses

#(F_mass - M_mass) / F_mass

#and then make a single histogram that shows all of the species-level differences. Add a vertical line at 0 difference for reference

avian_new <- mutate(avian, rel_size =(F_mass - M_mass) / F_mass)

ggplot(avian_new) +
  geom_histogram(mapping = aes(x = rel_size)) +
  geom_vline(mapping = aes(xintercept = 0)) +
  labs(x = "Relative Mass")


#Combine the two other tasks to produce histograms of the relative size difference for each family, only including families with more than 25 species.


large_avian_new <- inner_join(avian_new, large_n_families, by = "Family")

ggplot(data = large_avian_new) +
  geom_histogram(aes(x =rel_size)) +
  geom_vline(aes(xintercept = 0)) +
  facet_wrap(~Family) +
  labs(x = "Relative Size") 


#save the figure from task 3 as a jpg file with the name sexual_dimorphism_histogram.jpg

ggsave("best_plot_ever.jpg")
