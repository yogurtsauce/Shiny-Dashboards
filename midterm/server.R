library(DT)

data <- read.csv("data/GlobalMusicData_clean.csv")
oldData <- read.csv("data/GlobalMusicData.csv")



# make a table to display the og data
variableName <- c()
# take column names from old data to put into the table
for (name in names(oldData)) {
    variableName <- append(variableName, name)
}

possibleEntries <- c(
    "string",
    "string",
    "string",
    "0-100",
    "string",
    "string",
    "string",
    "string",
    "string",
    "string",
    "string",
    "0.0-1.0",
    "0.0-1.0",
    "0-11",
    "-60-0",
    "0 or 1",
    "0.0-1.0",
    "0.0-1.0",
    "0.0-1.0",
    "0.0-1.0",
    "0.0-1.0",
    "however fast the song is",
    "however long the song is"

)

colDescription <- c(
    "Unique song ID",
    "Name of the song",
    "Song's artist",
    "Song popularity - higher is better",
    "Unique album ID",
    "Song's album name",
    "Release date of album",
    "Name of playlist",
    "Playlist Id",
    "Playlist genre",
    "Playlist subgenre",
    "How 'danceable' a song is based on tempo, rhythm stability,
    beat strength, and overall regularity - higher is better",
    "Represents a perceptual measure of intensity and activity 
    based on dynamic range, perceived loudness, timbre, onset rate, 
    and general entropy. Songs with higher energy feel faster, 
    louder, and noisier - higher is better",
    "An estimated key of the track. Uses standard Pitch Class notation
    (0 = C, 1 = C#/Db). If there wasn't a key detected, the value is -1",
    "Overall loudness of a song in decibels (dB). The
    loudness values are averaged across the song.",
    "1 means the song is in a major key, 0 means it's in minor",
    "How talkative a song is. Above .66 are songs with mostly words,
    .33-.66 are songs with a mix of music and words, 
    and below are probably songs without words",
    "Confidence measure of whether the song is acoustic 
    - higher means higher confidence",
    "Predicts whether a track contains no vocals. 'Oohs' and 'aahs'
    are treated as instrumental. - higher means the song is more likely 
    to have little to no vocal content",
    "Detects the presence of an audience in the recording. .8 most likely
    means the song is live",
    "Music positiveness conveyed by the song - happier songs are higher",
    "Estimated tempo of the song in beats per minute",
    "Duration of song in milliseconds"
)

dataDescriptionTable <- data.frame(
    "VariableNames" = variableName,
    "PossibleEntries" = possibleEntries,
    "Description" = colDescription
)


server <- function(input, output, session) {
    # url var
    url <- a("API reference",
        href = "https://developer.spotify.com/documentation/web-api/reference/#/",
        target = "_blank",
        rel = "noopener noreferrer"
    )
    # hyperlinks
    output$link1 <- renderUI({
        tagList("You can read more about doing http pull requests here:", url)
    })

    url2 <- a("Here",
        href = "https://dplyr.tidyverse.org/",
        target = "_blank",
        rel = "noopener noreferrer"
    ) 
    output$dep1 <- renderUI({
        tagList("I used dyplr for the 'pipe' functionality. Link:", url2)
    })



    # table to describe the data
    output$dataDescription <- renderDT(
        dataDescriptionTable,
        style = "bootstrap",
        options = list(
            dom = "tp"
        )
    )

    # head5 table
    output$head5 <- renderDT(
        head(data,5),
        style = "bootstrap",
        options = list(
            dom = "t",
            scrollY = "250px",
            scrollX = "1px"
        )
    )

    # tail5 table
    output$tail5 <- renderDT(
        tail(data, 5),
        style = "bootstrap",
        options = list(
            dom = "t",
            scrollY = "250px",
            scrollX = "1px"
        )
    )


    # raw data table
    output$mytable1 <- renderDT(
        data,
        style = "bootstrap",
        filter = "top",
        extensions = "Buttons",
        options = list(
            deferRender = TRUE,
            dom = "Bfrtip",
            scrollX = "100px",
            scrollY = "400px",
            buttons = list("colvis", "print", list(
                extend = "collection",
                buttons = c("csv", "excel", "pdf"),
                text = "Download"
            ))
        )
    )
}