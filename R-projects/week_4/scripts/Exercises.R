



# Shrub Volume Data Basics

shrub_dim <- read.csv("data/shrub-volume-experiment.csv")

names(shrub_dim)


str(shrub_dim)

head(shrub_dim)


select(shrub_dim, length)



select(shrub_dim, site, experiment)


filter(shrub_dim, height > 5)

new_shrub_dim <- mutate(shrub_dim, volume = length*width*height)


# Shrub Volume Aggregation


by_site <- group_by(shrub_dim, site)

avg_height <- summarize(by_site, avg_height = mean(height))



by_experiment <- group_by(shrub_dim, experiment)



avg_height_exp <- summarize(by_experiment, avg_height = mean(height))



max_height <- summarize(by_site, max_height = max(height))




by_experiment <- group_by(shrub_dim, experiment)
avg_height <-
  summarize(by_experiment, avg_height = mean(height))



#Shrub Volume Join...


exp_data <-  read.csv("data/shrub-volume-experiments-table.csv")


outer_join(shrub_dim, exp_data, by = "experiment")
