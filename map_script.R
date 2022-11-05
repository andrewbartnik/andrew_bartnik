library(tidyverse)
library(sf)
library(tmap)
library(mapview)
library(leafpop)
library(leaflet)
library(viridis)

# Read in US city data
file_path <- "/Users/andrewbartnik/Desktop/github/andrewbartnik.github.io/simplemaps_worldcities_basicv1.75/worldcities.csv"

world <- read_csv(file_path) |> 
  select(city, lat, lng, country) |> 
  add_row(city = c('Reine', 'Senja', 'Monteverde Cloud Forest', 'Geiranger', 'Geirangerfjord', 'Seven Sisters', 'Odda', 'Trolltunga', 'Segla', 'Lyngen', 'Reinebringen', 'Andoya', 'Sommaroy'), 
          lat = c(67.9324,69.2965, 10.3026, 62.1008, 62.117616, 62.1071, 60.0692, 60.1242, 69.5075, 69.7216, 67.9277, 69.1000, 69.6277), 
          lng = c(13.0887, 17.6459, -84.7957, 7.2059, 7.157954, 7.0942, 6.5462, 6.7400, 17.5955, 20.0580, 13.0665, 15.7167, 18.0348) , 
          country = c('Norway', 'Norway', 'Costa Rica', 'Norway', 'Norway', 'Norway','Norway','Norway','Norway', 'Norway','Norway','Norway','Norway'))

# Create df for places ive been
my_cities <- tribble(
  ~city, ~country, ~month, ~year,
  'Oslo', 'Norway', 5, 2016,
  'Geiranger', 'Norway', 5, 2016,
  'Geirangerfjord', 'Norway', 5, 2016,
  'Seven Sisters', 'Norway', 5, 2016,
  'Odda', 'Norway', 5, 2016,
  'Trolltunga', 'Norway', 5, 2016,
  'Senja', 'Norway', 5, 2016,
  'Segla', 'Norway', 5, 2016,
  'Lyngen', 'Norway', 5, 2016,
  'Reine', 'Norway', 5, 2016,
  'Reinebringen', 'Norway', 5, 2016,
  'Andoya', 'Norway', 5, 2016,
  'Sommaroy', 'Norway', 5 ,2016,
  'Tromsø', 'Norway', 5, 2016,
  'Stryn', 'Norway', 5, 2016,
  'Voss', 'Norway', 5, 2016
  
  )
my_cities <- as.data.frame(my_cities)

# Left join the data sets
my_cities_lat_lng <- left_join(my_cities, world)

# Rename columns for nice map viewing
cols <- c("City", "Country", "Month", 'Year', "Latitude", "Longitude")
names(my_cities_lat_lng) <- cols

# Map view it
my_map <- mapview(my_cities_lat_lng, 
                  xcol = "Longitude", 
                  ycol = "Latitude", 
                  zcol = "City",
                  crs = 4269, 
                  grid = FALSE,
                  legend = FALSE)
my_map

#IMAGES

img <- function(file) {
  a <- as.character(file)
  file.path('photos', a)
}
mont1_img <- img("oslo1.jpeg")
geiranger <- img('geiranger.jpeg')
geirangerfjord <- img('geirangerfjord2.jpeg')
seven_sisters <- img('sevensisters.jpeg')
odda <- img('odda.jpeg')
ttunga <- img('trolltunga.jpeg')
senja <- img('senja.jpeg')
segla <- img('segla.jpeg')
lyngen <- img('lyngen.jpeg')
reine <- img('reine.jpeg')
reinebringen <- img('reinebringen1.jpeg')
andoya <- img('andoya.jpeg')
sommaroy <- img('sommaroy.jpeg')
tromso <- img('tromso.jpeg')
stryn <- img('somewherenorway.jpeg')
voss <- img('voss.jpeg')


                       

#  Make a vector of the images and add to df
 img_vec <- c(mont1_img, geiranger, geirangerfjord, seven_sisters, odda, ttunga, senja, segla, lyngen, reine, reinebringen, andoya, sommaroy, tromso, stryn, voss)
# 
# # Make a leaflet map
 leaflet <- leaflet(my_cities_lat_lng) %>%
  addProviderTiles("CartoDB.Positron",
                   group = "CartoDB.Positron") %>%
  addCircles(lng = ~Longitude,
             lat = ~Latitude,
             fill = TRUE,
             color = "steelblue",
             group = "City",
             label = ~City) %>%
  addPopupImages(img_vec,
                 group = "City",
                 width = 175,
                 tooltip = FALSE)

leaflet
# 
# 
# 
# 
# 
# 
# Footer
# © 2022 GitHub, Inc.
# Footer navigation
# Terms
# Privacy
# Security
# Status
# Docs
# Contact GitHub
# Pricing
# API
# Training
# Blog
# About


#    "Melbourne", "Australia", 4, 2003,
# "Sydney", "Australia", 5, 2006,
# "Torquay", "Australia", 5, 2005,
# "Ballarat", "Australia", 8, 2007,
# "Alice Springs", "Australia", 5, 2008,
# 'Reine', 'Norway', 5, 2016,
# 'Senja', 'Norway', 5, 2018,
# 'Monteverde Cloud Forest', 'Costa Rica', 5, 2021