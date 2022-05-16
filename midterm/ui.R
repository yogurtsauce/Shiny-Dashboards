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
        strong("Global Music Data"),
        " that can be obtained through spotify's API (I downloaded a
        .csv provided by my Prof).",
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
    h4(strong("The process")),
    p(
        "It would be nice and simple if we could collect data and immediately
        perform an analysis on it; however, we can't do that all of the time. In
        this example, I'll be skipping the Extract Transform Load ETL
        process and focus on preparing the data for analysis by following these
        steps: "
    ),
    tags$ol(
        tags$li("Define the question (the why part)"),
        tags$li("Collect the data (usually from an ETL pipeline)"),
        tags$li("Clean the data (the boring part)"),
        tags$li("Explore the data (what story can I tell from this data?
            this is where you do the modeling/analysis stuff)"),
        tags$li("Visualize the data (present your story to readers)")
    ),
    br(),
    h2(strong("Dependencies")),
    br(),
    h2(strong("The Data")),
    uiOutput("link1"),
    br(),
    h2(strong("Proposed Method")),
)

# actual page 2
rawDataPage <- tabPanel(
    "Raw Data",
    h1(strong("Raw Data")),
    tags$hr(style = "border-color: white;"),
    fluidRow(
        column(12, dataTableOutput("mytable1"))
    )
)


# page 3
sourceCode <- tabPanel(
    "Source Code",
    h1(strong("Source Code")),
    tags$a(
        href = "https://github.com/yogurtsauce/Shiny-Dashboards/tree/master/midterm",
        "Link to Github Repo",
        target = "_blank",
        rel = "noopener noreferrer"
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