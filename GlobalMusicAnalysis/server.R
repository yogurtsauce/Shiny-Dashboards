source("Code/Main.R")

server <- function(input, output) {
    # render the original data set DT
    output$originalData <- renderOGDT
}