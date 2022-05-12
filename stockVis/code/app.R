library(shiny)
library(quantmod)

source("stockVis/code/helpers.R")

options(shiny.autoreload = TRUE)
runApp(appDir = "stockVis/code")
