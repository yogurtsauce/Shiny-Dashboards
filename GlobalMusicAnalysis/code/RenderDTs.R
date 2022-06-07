# load the libraries #
source("code/libraries.R")
source("code/dataprep.R")


# function for displaying the raw datasets #
datatableTemplate <- function(nameOfDataset) {
    renderDT(
        nameOfDataset,
        style = "bootstrap",
        filter = "top",
        extensions = "Buttons",
        options = list(
            deferRender = TRUE,
            dom = "Bfrtip",
            scrollX = "400px",
            scrollY = "400px",
            buttons = list("colvis", "print", list(
                extend = "collection",
                buttons = c("csv", "excel", "pdf"),
                text = "Download"
            ))
        )
    )
}
datatableTemplate2 <- function(nameOfDataset) {
    renderDT(
        nameOfDataset,
        style = "bootstrap",
        filter = "top",
        extensions = "Buttons",
        options = list(
            deferRender = TRUE,
            dom = "Bfrtip",
            scrollX = "400px",
            scrollY = "200px",
            buttons = list("colvis", "print", list(
                extend = "collection",
                buttons = c("csv", "excel", "pdf"),
                text = "Download"
            ))
        )
    )
}

# describing the data
variableName <- c(
    "track_name",
    "track_artist",
    "track_popularity",
    "track_album_name",
    "track_album_release_date",
    "playlist_name",
    "playlist_genre",
    "playlist_subgenre",
    "danceability",
    "energy",
    "key",
    "loudness",
    "mode",
    "speechiness",
    "acousticness",
    "instrumentalness",
    "liveness",
    "valence",
    "tempo",
    "duration_ms"
)


possibleEntries <- c(
    "string",
    "string",
    "0.0 - 100.0",
    "string",
    "string",
    "string",
    "string",
    "string",
    "0.0-1.0",
    "0.0-1.0",
    "0-11",
    "-60~0",
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
    "Name of track",
    "Name of track's artist",
    "Song popularity - higher is better",
    "Song's album name",
    "Release date of album",
    "Name of playlist",
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
    "VarDescription" = colDescription
)

top5Data <- head(data, 5)
bot5Data <- tail(data, 5)