library(DT)
library(shinythemes)

data <- read.csv("data/GlobalMusicData_clean.csv")






# page 1
introPage <- tabPanel(
    "Introduction",
    h1(strong("Introduction")),
    tags$hr(style = "border-color: white;"),

    # purpose
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
    #

    h4(strong("Who can use this analysis?")),
    p(
        "Anyone can! You can use this just for knowledge and fun,
        producers can determine which type of artist will be profitable
        to work with, and artists can evaluate how to manipulate their music
        to make it more popular."
    ),
    br(),
    #
    # the process
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

    # dependencies
    h2(strong("Dependencies")),
    p("I try to import as few libraries as possible and try to always
    go the vanilla route in my code."),
    uiOutput("dep1"),
    br(),


    # the data
    h2(strong("The Data")),
    uiOutput("link1"),
    h4(strong("A quick summary on the original dataset")),
    fluidRow(
        column(8, dataTableOutput("dataDescription"))
    ),
    br(),
    h4(strong("What I did")),
    p(
        "I used ",
        tags$code("data <- read.csv(\"midterm/data/GlobalMusicData.csv\")"),
        "to import data into my .R script."
    ),
    p(
        "I then wanted to immediately change the names of the columns. I 
        also removed all columns that fell out of the scope of my analysis
        - to analyze the impact on a song's popularity based on the
        elements of the song. So I removed the track's name, artist, 
        playlist stuff except for the genre, and album stuff. That data would
        be useful in another analysis; but just doesn't fit the agenda of mine.",
        tags$pre("
for (names in names(data)) { #to print the names of the rows individually
    print(names)
}

cleanDataDir <- \"midterm/data/GlobalMusicData_clean.csv\" # initialize for later
dirtyDataNames <- c() # initialize empty vector

dirtyDataNames <- dirtyDataNames[!dirtyDataNames %in% c( # columns we don't want
    \"track_id\",
    \"track_name\",
    \"track_album_name\",
    \"track_album_release_date\",
    \"track_album_id\",
    \"playlist_id\",
    \"playlist_name\",
    \"track_artist\"
)]

data <- data[dirtyDataNames] #assign names to df
colnames(data) <- c( # change names of columns
    \"TrackPopularity\",
    \"PlaylistGenre\",
    \"PlaylistSubGenre\",
    \"Danceability\",
    \"Energy\",
    \"Key\",
    \"Loudness\",
    \"Mode\",
    \"Speechiness\",
    \"Acousticness\",
    \"Instrumentalness\",
    \"Liveness\",
    \"Valence\",
    \"Tempo\",
    \"Duration_ms\"
)

# check if file exists. if yes then delete and make a new one
newCsvFunc <- function() {
    if (file.exists(cleanDataDir)) {
        unlink(cleanDataDir)
        newCsvFunc()
        print(\".csv file deleted\")
    } else {
        data %>%
            write.csv(
                cleanDataDir,
                quote = FALSE,
                row.names = FALSE,
                sep = \",\",
                fileEncoding=\"UTF-8\"
                )
    }
    print(\"new .csv file created\")
}
# call function
newCsvFunc()
        ")
    ),
    p(
        "After that, we can check the top 5 records with ",
        tags$code("head(newCsv,5)"), "to get this:"
    ),
    fluidRow(
        column(8, dataTableOutput("head5"))
    ),
    br(),
    p(
        "And the bottom 5 records with", tags$code("tail(newCsv,5)", ":")
    ),
    fluidRow(
        column(8, dataTableOutput("tail5"))
    ),
    br(),
    p(
        "I viewed the summarized statistics by using",
        tags$code("summary(cleanCsv)"),
        "and the structure of the data using",
        tags$code("str(cleanCsv)"), "to get:"
    ),
    img(src = "summarycode.png"),
    img(src = "strcode.png"),
    p(
        "I was not concerned about the data types because they're
        either string or int/float. I decided to keep floats at the same
        decimal points just because that's more work and extra precision
        is always nice."
    ),
    p(
        "My pictures are currently broken right now, but you would
        see the summarized statistics. Nothing looks out of the ordinary. There
        are about 33k observations"
    ),

    # proposed method
    h2(strong("Proposed Method")),
    p(
        "I plan on doing some data mining to see what info I can
        gather from the data. Maybe do some machine learning with
        regression and tree algorithms. The data set is pretty decent
        so 70-80% of it will go a long ways. Histograms to visually see
        the summarized statistics, and regression plots to easily
        tell the relationships between variables 
        (with buttons to change the variables of course). 
        I might grab more info from the API. I'm not sure 
        what else I need to know but I'm sure I will figure it out."
    ),
)

# actual page 2
rawDataPage <- tabPanel(
    "Raw Data",
    h1(strong("Raw Data")),
    tags$hr(style = "border-color: white;"),
    fluidRow(
        column(8, dataTableOutput("mytable1"))
    )
)

# load everything to UI
ui <- navbarPage(
    theme = shinytheme("darkly"),
    "Nicholas' Midterm",
    introPage,
    rawDataPage
)