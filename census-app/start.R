library(shiny)
library(maps)
library(mapproj)

counties <- readRDS("census-app/data/counties.rds")

source("census-app/code/helpers.R", local = TRUE)

options(shiny.autoreload = TRUE)
runApp(appDir = "census-app/code")