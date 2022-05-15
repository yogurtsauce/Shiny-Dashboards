library(DT)
library(shinythemes)

data <- read.csv("data/GlobalMusicData.csv")

# page 1
introPage <- tabPanel(
    "Introduction",
    h1(strong("Introduction")),
    tags$hr(style = "border-color: white;"),
    h2(strong("Purpose")),
    p(
        "Analytics and visualization on a data set named",
        strong("Global Music Data"), "."
    ),
    p(
        "The data set can give us insights on how which factors can impact
        how popular a song is; such as how loud it is, the genre,
        the key, tempo, and etc."
    ),
    br(),
    h4(strong("Who can use this analysis?")),
    p(
        "Anyone can! You can use this just for knowledge and fun,
        producers can determine which type of artist will be profitable
        to work with, and artists can evaluate how to manipulate their music
        to make it more popular."
    ),
    br(),
    h2(strong("Method")),
    br(),
    h2(strong("Dependencies")),
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
    h1(strong("Raw Data (takes a while to load when not local)")),
    tags$hr(style = "border-color: white;"),
    sidebarLayout(rawDataSideBar, rawDataMain),
)


# page 3
sourceCode <- tabPanel(
    "Source Code",
    h1(strong("Source Code")),
    tags$a(
        href = "https://github.com/yogurtsauce/Shiny-Dashboards/tree/master/midterm",
        "Link to Github Repo"
    )
)


# load everything to UI
ui <- navbarPage(
    theme = shinytheme("darkly"),
    "Nicholas' Midterm",
    introPage,
    rawDataPage,
    sourceCode
)