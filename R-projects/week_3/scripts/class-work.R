3 + 5

12 / 7 


weight_kg <- 55


2.2 * weight_kg


# Functions and their agruments


round(3.1498998898)

args(round)


round(3.14159, digits = 2)


# Vector 


weight_g <- c(50, 60, 65, 82)

weight_g

animals <- c("mouse", "rat", "dog", "cat")


more_animals <- animals[c(1, 2, 3, 2, 1, 4)]

more_animals


heights <- c(2, 4, 4, NA, 6)

mean(heights)
mean(heights, na.rm = TRUE)


weight <- 26

double_weight <- weight * 2



weight <- 22



pi_approx <- round(3.14159, 2)
pi_approx




# DATA STRUCTURES

sites <- c("a", "a", "b", "c")

str(sites)

length(sites)

sites[1]

sites[1:3]

sites[c(4, 1, 3)]


density_ha <- c(2.8, 3.2, 1.5, 3.8)
mean(density_ha)
max(density_ha)
min(density_ha)
sum(density_ha)

sites <- c("a", "a", "b", "c")
density_ha <- c(2.8, 3.2, 1.5, 3.8)
area_ha <- c(3, 5, 1.9, 2.7)

total_number <- density_ha * area_ha

total_number 

total_number[sites != 'a']


# Data frames

surveys <- data.frame(sites, density_ha, area_ha)

str(surveys)
nrow(surveys)
ncol(surveys)


surveys$area_ha


surveys["area_ha"]



shrub_data <- read.csv('data/shrub-dimensions-labeled.csv')

animals <- c("mouse", "rat", "dog", "cat")
animals[animals == "cat" | animals == "rat"]

