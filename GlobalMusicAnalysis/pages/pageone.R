source("code/libraries.R")
source("code/graphs.R")


# introduction tab panel #
introductionTab <- tabPanel(
    "Introduction",
    h1("Introduction"),
    tags$hr(style = "border-color: white;"),
    p(
        "I explore a dataset that can be obtained through the Spotify API
        (although, I downloaded this one as provided by my professor). This
        dataset has information about all global music, their popularity, and
        the variables of the song, such as loudness or key."
    ),
    p(
        "The purpose of my analysis will be to determine what factors
        makes a song more popular. Anyone can use the results to shape
        their song to increase the popularity."
    ),
    dataTableOutput("dataSummary"),
    p(
        "Using ", tags$code("head(data, 5)"), "I can display the top 5 records.
        Using tail instead of head displays the bottom 5 records."
    ),
    dataTableOutput("top5"),
    dataTableOutput("bot5"),
    p(
        "There are 28356 records of data in this dataset post cleaning."
    ),
    p(
        "Using ", tags$code("summary(data)"), "we are able to get a nice
        summary of the data. We see that the average song is 226.576 seconds
        long, 121 beats/minute, decently danceable, decently energetic, in the key of F,
        pretty loud, either major/minor key, have few lyrics, are not pure accoustic,
        have lyrics, not live, and between happy and sad."
    )
)


# dependencies tab panel #
dependenciesTab <- tabPanel(
    "Dependencies",
    h1("Dependencies"),
    tags$hr(style = "border-color: white;"),

    # tidyverse
    h2(tags$a(href = "https://www.tidyverse.org/", "Tidyverse")),
    tags$code("install.packages(\"tidyverse\")"),
    tags$ul(

        # list most tidyverse libraries
        tags$li(
            "A library that contains a plethora of useful libraries such as:",
            tags$ul(
                tags$li(
                    tags$a(href = "https://ggplot2.tidyverse.org/", "ggplot2"),
                    "for data visualization.",
                    br(),
                    tags$code("install.packages(\"ggplot2\")")
                ),
                tags$li(
                    tags$a(href = "https://dplyr.tidyverse.org/", "dyplyr"),
                    "for easier data manipulation.",
                    br(),
                    tags$code("install.packages(\"dplyr\")")
                ),
                tags$li(
                    tags$a(href = "https://tidyr.tidyverse.org/", "tidyr"),
                    "for easier data tidying.",
                    br(),
                    tags$code("install.packages(\"tidyr\")")
                ),
                tags$li(
                    tags$a(href = "https://readr.tidyverse.org/", "readr"),
                    "for faster data importing.",
                    br(),
                    tags$code("install.packages(\"readr\")")
                ),
                tags$li(
                    tags$a(href = "https://purrr.tidyverse.org/", "purrr"),
                    "for an easier way to work with functions and vectors.",
                    br(),
                    tags$code("install.packages(\"purrr\")")
                ),
                tags$li(
                    tags$a(href = "https://tibble.tidyverse.org/", "tibble"),
                    "for lazy data.frame management.",
                    br(),
                    tags$code("install.packages(\"tibble\")")
                ),
                tags$li(
                    tags$a(href = "https://stringr.tidyverse.org/", "stringr"),
                    "for easier string manipulation.",
                    br(),
                    tags$code("install.packages(\"stringr\")")
                ),
                tags$li(
                    tags$a(href = "https://forcats.tidyverse.org/", "forcats"),
                    "for easier handling of factors and levels.",
                    br(),
                    tags$code("install.packages(\"forcats\")")
                ),
            )
        )
    ),


    # shiny
    h2(tags$a(href = "https://shiny.rstudio.com/", "Shiny")),
    tags$code("install.packages(\"shiny\")"),
    tags$ul(
        tags$li("A framework that makes dynamic websites with R.")
    ),


    # shiny themes
    h2(tags$a(href = "https://rstudio.github.io/shinythemes/", "Shiny Themes")),
    tags$code("install.packages(\"shinythemes\")"),
    tags$ul(
        tags$li("Used for theming Shiny websites.")
    ),


    # DT
    h2(tags$a(href = "https://rstudio.github.io/DT/", "DT")),
    tags$code("install.packages(\"DT\")"),
    tags$ul(
        tags$li("An R interface to the DataTables Javascript library.")
    ),


    # rsconnect
    h2(tags$a(href = "https://rstudio.github.io/rsconnect/", "rsconnect")),
    tags$code("install.packages(\"rsconnect\")"),
    tags$ul(
        tags$li("Used for deploying my Shiny app to a website.")
    ),

    # sqldf
    h2(tags$a(href = "https://cran.r-project.org/web/packages/sqldf/index.html", "sqldf")),
    tags$code("install.packages(\"sqldf\")"),
    tags$ul(
        tags$li("Used to use sql statements to manipulate data.")
    )
)


# data prep tab panel
dataPrepTab <- tabPanel(
    "Data Preparation",
    h1("Data Preparation"),
    tags$hr(style = "border-color: white;"),
    p(
        "I made a function to find nulls:"
    ),
    tags$pre(
    "# find nulls function #
    findNulls <- function(nameOfDataset) { # nolint
        if (sum(is.na(nameOfDataset)) != 0) {
            nameOfDataset %>%
            summarise_all(~ sum(is.na(.))) %>%
            select_if(. > 0)
        } else {
            print(\"There are no nulls.\")
        }
    }
    findNulls(data)"
    ),
    p(
        "Using the function, we see that
        there are 5 nulls in track_name,
        track_artist, and track_album_name.
        Not really a concern because it's not essential
        to the analysis."
    ),
    br(),
    p(
        "Using the code below, we see that there are 4477 duplicate rows."
    ),
    tags$pre("
# find duplicates #
findNumDupe <- data %>%
    filter(duplicated(track_id)) %>%
    arrange(track_name) %>%
    select(track_name, track_popularity) %>%
    tally()

    findNumDupe <- sprintf(\"There are %s duplicate rows.\", findNumDupe)

    findNumDupe
    "),
    p(
        "Having duplicates isn't awesome to do an analysis on, so I'll remove them."
    ),
    tags$pre("
# for all duplicates, keep the one with the highest popularity. #
# https://stackoverflow.com/questions/24011246/deleting-rows-that-are-duplicated-in-one-column-based-on-the-conditions-of-anoth
data <- data %>%
    arrange(track_id, -track_popularity) %>%
    filter(duplicated(track_id) == FALSE)

    sprintf(\"There are now %s rows after removing the duplicates.\", count(data))
    findNumDupe
    "),
    p(
        "I removed all duplicates and keep the ones with the highest
        popularity. The reason I did that was because the duplicates
        were just the same songs in a less popular playlist or album.
        I ran ", tags$code("findNumDupe"), "again to check for duplicates - 
        none!"
    ),
    br(),
    p(
        "I discovered an awesome library to use SQL statements in R. I mostly
        started using it after here. Now I'll check to see if dates
        are correct."
    ),
    tags$pre(
"# checking to see if there are any dates that aren't in the right format
sqldf(\"
select track_album_release_date
from data
where length(track_album_release_date) < 6
limit 5
\")"
    ),
    p(
        "There are many dates that are just years. We can get around that
        by just selecting dates per album because the other tracks have correct
        dates."
    )
)


# exploratory data analysis tab panel
exploratoryAnalysisTab <- tabPanel(
    "Exploratory Data Analysis / Visualization",
    h1("Exploratory Data Analysis / Visualization"),
    tags$hr(style = "border-color: white;"),
    p(
        "Let's check to see if there is a correlation between number of tracks/album
        and the popularity. I gathered the average popularity of each album and
        plotted it against the number of tracks"
    ),
    tags$pre("
tracksPerAlbum <- sqldf(\"
    select count(track_name) as TracksPerAlbumCol,
    avg(track_popularity) as AverageAlbumPopularity
    from data
    group by track_album_name
    order by track_popularity desc
\")

numVsPop <- tracksPerAlbum %>%
    ggplot(aes(TracksPerAlbumCol, AverageAlbumPopularity)) +
    geom_jitter(width = .1, size = .5, alpha = .1) +
    geom_smooth() +
    coord_cartesian(xlim = c(0, 25), ylim = c(0, 100)) +
    ggtitle(\"Tracks Per Album Vs. The Popularity\") +
    labs(x = \"Tracks Per Album\", y = \"Average Album Popularity\")
    "),
    plotOutput("numTrackPlot"),
    p(
        "We see that average popularity goes down a just a little bit as there
        are more tracks in an album. It could just artists that release long
        albums are less listened to."
    ),
    br(),
    p(
        "Now we check to see which genres are more popular over time."
    ),
    tags$pre("
    # render genre over time
    genreGroup <- reactive({
        input$genreInput
    })
    
    output$genreOverTime <- renderPlot({
        data %>%
            ggplot(aes_string(
                \"track_album_release_date\",
                \"track_popularity\",
                group = genreGroup()
            )) +
            geom_smooth(aes_string(
                color = genreGroup()
            ),
            se = F,
            method=\"gam\"
            ) +
            scale_x_date(
                date_breaks = \"5 years\",
                date_labels = \"%Y\",
                limits = as.Date(c(input$genreDateInput1, input$genreDateInput2))
            ) +
            ggtitle(\"Genre Popularities Over Time\") +
            labs(x = \"Years\", y = \"Popularity\")
    })
    "),
    plotOutput("genreOverTime"),
    selectInput(
        "genreInput",
        "Select grouping:",
        choices = c("playlist_genre", "playlist_subgenre")
    ),
    sliderInput(
        "genreDateInput1",
        "Beginning Date:",
        min = as.Date("1970-01-01", "%Y-%m-%d"),
        max = as.Date("2022-01-01", "%Y-%m-%d"),
        value = as.Date("1970-01-01"),
        timeFormat = "%Y-%m-%d"
    ),
    sliderInput(
        "genreDateInput2",
        "End Date:",
        min = as.Date("1970-01-01", "%Y-%m-%d"),
        max = as.Date("2022-01-01", "%Y-%m-%d"),
        value = as.Date("2022-01-01"),
        timeFormat = "%Y-%m-%d"
    ),
    p(
        "We see that genre popularities do change over time."
    ),
    p("Rock had its time and is now becoming less popular."),
    p("Edm was extremely popular, had a fall, and is now in."),
    p("Same with Latin."),
    p("Rap was in, faded, and is now in the lead for most popular."),
    p("R & B struggled but is now pulling its weight."),
    p("Pop is the genre with the most uncertainty"),
    br(),
    p(
        "Now we check to see which factors have an impact on popularity."
    ),
    tags$pre("
        # render popularity vs factors
    output$popularityFactors <- renderPlot({
        data %>%
            ggplot(aes_string(input$popularityInput, \"track_popularity\")) +
            geom_jitter(alpha = .25) +
            geom_smooth() +
            ggtitle(\"Popularity vs Factors\") +
            labs(x = input$popularityInput, y = \"Popularity\")
    })"),
    plotOutput("popularityFactors"),
    selectInput(
        "popularityInput",
        "Select x variable:",
        choices = c(
            "danceability",
            "energy",
            "key",
            "mode",
            "speechiness",
            "acousticness",
            "instrumentalness",
            "liveness",
            "valence",
            "tempo",
            "duration_ms"
        )
    ),
    p("7/10 energy does best and performs significantly worse after that."),
    p("Danceability is pretty stable with a slight increase the higher it gets."),
    p("The key doesn't matter at all."),
    p("Being in a major key makes the song just very slightly more popular"),
    p("Speechiness doesn't matter at all"),
    p("Pure acoustic songs have less popularity"),
    p("A song with pure vocal content does better by a little"),
    p("Live songs perform worse than recorded songs"),
    p("Extremely sad songs are slightly less popular than happy songs"),
    p("Songs that are 110-140 bpm are significantly less popular with a slight increase after 140."),
    p("Songs shorter than 1.5 minutes are extremely unpopular, 2.5 is the highest, and it only
    gets lower from there.")
    )



# Summary tab panel
summaryTab <- tabPanel(
    "Summary",
    h1("Summary"),
    tags$hr(style = "border-color: white;"),
    p(
        "Rap, pop, and electronic music are the safest genres to
        produce music in. Jazz performs significantly worse than any
        other genre."
    ),
    p(
        "Songs should be decently energetic, danceable, not purely acoustic,
        not live, pretty happy, about 2.5 minutes long, and about 150 bpm
        for the best chances for it to be popular."
    )
)


# source code panel
sourceCodeTab <- tabPanel(
    "Source Code",
    h1("Source Code"),
    tags$hr(style = "border-color: white;"),
    tags$a(
        href = "https://github.com/yogurtsauce/Shiny-Dashboards/tree/master/GlobalMusicAnalysis",
        "GitHub"
    )
)