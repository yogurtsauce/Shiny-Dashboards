library(DT)
library(shinythemes)

data <- read.csv("data/GlobalMusicData.csv")

# page 1
introPage <- tabPanel(
    "Introduction",
    h1("Introduction"),
    tags$hr(style = "border-color: white;"),
    h2("Purpose"),
    p("Put stuff here that will introduce the user")
)


# page 2 stuff
selectValues <- names(data)
selectValues <- selectValues[
    !selectValues %in% c("track_id", "track_album_id", "playlist_id")
]

# page 2 sidebar
rawDataSideBar <- sidebarPanel(
    conditionalPanel(
        "selectColumns",
        checkboxGroupInput(
            "showVars",
            "Columns in diamonds to show:",
            choices = selectValues,
            selected = selectValues
        )
    ),
    width = 2
)


# page 2 main content
rawDataMain <- mainPanel(
    tabsetPanel(
        id = "dataset",
        tabPanel(
            "Global Music",
            DT::dataTableOutput("mytable1"),
            width = "100%"
        )
    )
)

# actual page 2
rawDataPage <- tabPanel(
    "Raw Data",
    h1("Raw Data"),
    tags$hr(style = "border-color: white;"),
    sidebarLayout(rawDataSideBar, rawDataMain),
)


# load everything to UI
ui <- navbarPage(
    theme = shinytheme("darkly"),
    "Nicholas' Midterm",
    introPage,
    rawDataPage
)