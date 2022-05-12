library(DT)
data <- read.csv("data/GlobalMusicData.csv")

# page 1
introPage <- tabPanel(
    "Introduction",
    titlePanel("Introduction"),
    p("Put stuff here that will introduce the user")
)

# page 2
selectValues <- names(data)
selectValues <- selectValues[!selectValues %in% c("track_id", "track_album_id", "playlist_id")]

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


rawDataMain <- mainPanel(
    tabsetPanel(
        id = "dataset",
        tabPanel("Global Music", DT::dataTableOutput("mytable1"),
            width = "10"
        )
    )
)


rawDataPage <- tabPanel(
    "Raw Data",
    titlePanel("Raw Data"),
    sidebarLayout(rawDataSideBar, rawDataMain)
)





# load everything to UI
ui <- navbarPage(
    "Nicholas' Midterm",
    introPage,
    rawDataPage
)