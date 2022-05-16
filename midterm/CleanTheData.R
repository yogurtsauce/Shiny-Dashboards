library(tidyverse)

data <- read.csv("midterm/data/GlobalMusicData.csv")

# get column names
# I like for loops because it's a column name per row
for (names in names(data)) {
    print(names)
}
names(data)

# initialize the variable
cleanDataDir <- "midterm/data/GlobalMusicData_clean.csv"

# check if file exists. if yes then delete and make a new one
newCsvFunc <- function() {
    if (file.exists(cleanDataDir)) {
        unlink(cleanDataDir)
        newCsvFunc()
    } else {
        data %>%
            write.table(
                cleanDataDir,
                quote = FALSE,
                sep = ",",
                row.names = FALSE,
                col.names = c(
                    "TrackId",
                    "TrackName",
                    "TrackArtist",
                    "TrackPopularity",
                    "TrackAlbumId",
                    "TrackAlbumName",
                    "TrackAlbumReleaseDate",
                    "PlaylistName",
                    "PlaylistId",
                    "PlaylistGenre",
                    "PlaylistSubGenre",
                    "Danceability",
                    "Energy",
                    "Key",
                    "Loudness",
                    "Mode",
                    "Speechiness",
                    "acousticness",
                    "Instrumentalness",
                    "Liveness",
                    "Valence",
                    "Tempo",
                    "Duration_ms"
                )
            )
    }
}

newCsvFunc()

newCsv <- read.csv("midterm/data/GlobalMusicData_clean.csv")
names(newCsv)
