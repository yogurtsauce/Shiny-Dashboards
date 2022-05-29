source("Code/Main.R")

# page one
pageOne <- tabPanel(
    "Home"
)


# page two
pageTwo <- tabPanel(
    "Dataset",
    fluidPage(
        tabsetPanel(
            tabPanel(
                "Original Dataset",
                dataTableOutput("originalData")
            ),
            tabPanel(
                "Clean Dataset",
                dataTableOutput("cleanData")
            )
        )
    )
)

# load things into the ui
ui <- navbarPage(
    theme = shinytheme("darkly"),
    "Global Music Analysis",
    pageOne,
    pageTwo
)