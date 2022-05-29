source("Code/Main.R")

# page one
pageOne <- tabPanel(
    "Home"
)


# page two
pageTwo <- tabPanel(
    "Dataset"
)

# load things into the ui
ui <- navbarPage(
    theme = shinytheme("darkly"),
    "Global Music Analysis",
    pageOne,
    pageTwo
)