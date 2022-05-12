library(shiny)
library(quantmod)

source("helpers.R")
source("ui.R")
source("server.R")

options(shiny.autoreload = TRUE)
runApp(appDir = "stockVis")