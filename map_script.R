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
  select(city, lat, lng, country) 

# Create df for cities I've lived in
my_cities <- tribble(
  ~city, ~country, ~month, ~year,
  "Melbourne", "Australia", 4, 2003,
  "Sydney", "Australia", 5, 2006,
  "Torquay", "Australia", 5, 2005,
  "Ballarat", "Australia", 8, 2007,
  "Alice Springs", "Australia", 5, 2008
  
  
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

### ------------------- Customize! --------------------------###
# Add an image for every city
# ic_img <- file.path("images", "IC.jpg")
# az_img <- file.path("images", "AZ.jpg")
# am_img <- file.path("images", "AMES.jpg")
# hi_img <- file.path("images", "HI.jpg")
# stl_img <- file.path("images", "STL.jpg")
# mb_img <- file.path("images", "MB.jpg")
# vb_img <- file.path("images", "vB.jpg")
# sea_img <- file.path("images", "SEA.jpg")
# sb_img <- file.path("images", "SB.jpg")
# 
# # Make a vector of the images and add to df
# img_vec <- c(ic_img, az_img, am_img, hi_img, stl_img, 
#              mb_img, vb_img, sea_img, sb_img)
# 
# # Make a leaflet map
# my_leaflet <- leaflet(my_cities_lat_lng) %>%
#   addProviderTiles("CartoDB.Positron", 
#                    group = "CartoDB.Positron") %>% 
#   setView(lng = -110.35, 
#           lat = 42.3601, 
#           zoom = 2.5) %>% 
#   addCircles(lng = ~Longitude,
#              lat = ~Latitude,
#              weight = ~Months * 3,
#              radius = ~Months,
#              fill = TRUE, 
#              color = "#1cd4ce", 
#              group = "Cities",
#              label = ~City) %>%
#   addPopupImages(img_vec, 
#                  group = "Cities", 
#                  width = 175, 
#                  tooltip = FALSE)
# 
# my_leaflet
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
