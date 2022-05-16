# init dependencies
library(tidyverse)

# vars/objects
data <- read.csv("midterm/data/GlobalMusicData.csv")
cleanDataDir <- "midterm/data/GlobalMusicData_clean.csv"
dirtyDataNames <- c()
dirtyDataNames <- dirtyDataNames[!dirtyDataNames %in% c( #columns we don't want
    "track_id",
    "track_album_name",
    "track_album_id",
    "playlist_id",
    "playlist_name",
    "track_artist"
)]

# get column names
# I like for loops because it's a column name per row
for (names in names(data)) {
    print(names)
}
names(data)

# append column names to var
for (name in names(data[23:1])) {
    dirtyDataNames <- append(name, dirtyDataNames)
}
# assign
data <- subset(data, , select = dirtyDataNames)


# check if file exists. if yes then delete and make a new one
newCsvFunc <- function() {
    if (file.exists(cleanDataDir)) {
        unlink(cleanDataDir)
        newCsvFunc()
        print(".csv file deleted")
    } else {
        data %>%
            write.table(
                cleanDataDir,
                quote = FALSE,
                sep = ",",
                row.names = FALSE,
                col.names = c(
                    "TrackName",
                    "TrackPopularity",
                    "TrackAlbumReleaseDate",
                    "PlaylistGenre",
                    "PlaylistSubGenre",
                    "Danceability",
                    "Energy",
                    "Key",
                    "Loudness",
                    "Mode",
                    "Speechiness",
                    "Acousticness",
                    "Instrumentalness",
                    "Liveness",
                    "Valence",
                    "Tempo",
                    "Duration_ms"
                )
            )
    }
    print("new .csv file created")
}
# call function
newCsvFunc()

# init
newCsv <- read.csv("midterm/data/GlobalMusicData_clean.csv")
# double check
names(newCsv)
