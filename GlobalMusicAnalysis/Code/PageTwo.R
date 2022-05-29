source("Code/Libraries.R")

ogDT <- tabPanel(
    "Original Dataset",
    dataTableOutput("originalData")
)

cleanDT <- tabPanel(
    "Clean Dataset",
    dataTableOutput("cleanData")
)