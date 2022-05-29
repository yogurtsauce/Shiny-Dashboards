source("code/libraries.R")

originalDataTab <- tabPanel(
    "Original Dataset",
    dataTableOutput("originalData")
)

cleanDataTab <- tabPanel(
    "Clean Dataset",
    dataTableOutput("cleanData")
)