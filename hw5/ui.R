library(DT)
library(shinythemes)

pageOne <- tabPanel(
    "Introduction",
    h1("Introduction"),
    tags$hr(style = "border-color: white;"),
    p(
        "This project demonstrates taking an operational database and turning
        it into a data warehouse using a star schema. The operational database
        was created and populated using SQL. I then used SQL to create the
        tables for the star schema and populated them."
    )
)


pageTwo <- tabPanel(
    "Visualization"
)


pageThree <- tabPanel(
    "Operational Tables"
)


pageFour <- tabPanel(
    "Data Warehouse Tables"
)


ui <- navbarPage(
    theme = shinytheme("darkly"),
    "Nicholas' Hw5",
    pageOne,
    pageTwo,
    pageThree,
    pageFour
)