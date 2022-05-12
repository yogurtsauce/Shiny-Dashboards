library(shiny)
library(maps)
library(mapproj)

counties <- readRDS("data/counties.rds")

source("helpers.R")
source("ui.R")
source("server.R")


shinyApp(ui = ui, server = server)