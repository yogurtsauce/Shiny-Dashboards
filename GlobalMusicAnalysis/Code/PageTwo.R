source("Code/Libraries.R")

originalDataTab <- tabPanel(
    "Original Dataset",
    dataTableOutput("originalData")
)

cleanDataTab <- tabPanel(
    "Clean Dataset",
    dataTableOutput("cleanData")
)