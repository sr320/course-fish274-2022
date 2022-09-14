



#getting  data
acacia <- read.csv("https://www.esapubs.org/archive/ecol/E095/064/ACACIA_DREPANOLOBIUM_SURVEY.txt", sep="\t", na.strings = "dead")

library(ggplot2)

ggplot(data = acacia, mapping = aes(x = CIRC, y = HEIGHT)) +
  geom_point(size = 3, color = "blue", alpha = 0.5) +
  labs(x = "Circumference [cm]", y = "Height [m]", title = "Acacia Survey at UHURU") 


#GROUPING

ggplot(acacia, aes(x = CIRC, y = HEIGHT, color = TREATMENT)) +
  geom_point(size = 3, alpha = 0.5)



ggplot(acacia, aes(x = CIRC, y = HEIGHT)) +
  geom_point(size = 3, alpha  = 0.5) +
  facet_wrap(~TREATMENT)



#LAYeRS

ggplot(acacia, aes(x = CIRC, y = HEIGHT)) +
  geom_point() +
  geom_smooth(method = "lm")


ggplot(acacia, aes(x = CIRC, y = HEIGHT, color = TREATMENT)) +
  geom_point() +
  geom_smooth(method = "lm")


trees <- read.csv("https://www.esapubs.org/archive/ecol/E095/064/TREE_SURVEYS.txt", sep="\t", na.strings = c("dead", "missing", "MISSING", "NA"))


ggplot() +
  geom_point(data = trees, aes(x = CIRC, y = HEIGHT), color = "gray") +
  geom_point(data = acacia, aes(x = CIRC, y = HEIGHT), color = "red") +
  labs(x = "Circumference [cm]", y = "Height [m]")


ggplot(mapping = aes(x = CIRC, y = HEIGHT)) +
  geom_point(data = acacia, color = "red") +
  geom_point(data = trees, color = "gray", alpha = 0.03) +
  labs(x = "Circumference [cm]", y = "Height [m]")

#Transformations
ggplot(acacia, aes(x = TREATMENT)) +
  geom_bar()


ggplot(acacia, aes(x = CIRC)) +
  geom_histogram(bins = 15) +
  scale_x_log10() +
  facet_wrap(~TREATMENT) +
  labs(x = "Circumference", y = "Number of Individuals")


## saving figures 
ggsave("acacia_by_treatment.jpg")


ggsave("figures/acacia_by_treatment.pdf", height = 5, width = 5)




