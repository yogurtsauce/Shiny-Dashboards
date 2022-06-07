source("main.R")



# page one
pageOne <- tabPanel(
    "Home",
    navlistPanel(
        "Navigation",
        widths = c(2, 10),

        # load tab panels into here
        introductionTab,
        dependenciesTab,
        dataPrepTab,
        exploratoryAnalysisTab,
        summaryTab,
        sourceCodeTab,
    )
)


# page two
pageTwo <- tabPanel(
    "Datasets",
    tabsetPanel(
        # load tab panels into here
        originalDataTab,
        cleanDataTab,
    )
)

# load things into the ui
ui <- navbarPage(
    theme = shinytheme("darkly"),
    "Global Music Analysis",

    # pages
    pageOne,
    pageTwo,
)