source("Code/Main.R")



# page one
pageOne <- tabPanel(
    "Home",
    navlistPanel(
        "Navigation",
        widths = c(2, 10),

        # load tab panels into here
        introduction,
        dependencies,
        dataPrep,
        descriptiveAnalysis,
        exploratoryAnalysis,
        summary
    )
)


# page two
pageTwo <- tabPanel(
    "Datasets",
    tabsetPanel(
        # load tab panels into here
        ogDT,
        cleanDT
    )
)

# load things into the ui
ui <- navbarPage(
    theme = shinytheme("darkly"),
    "Global Music Analysis",
    pageOne,
    pageTwo
)