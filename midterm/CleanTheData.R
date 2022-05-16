# init dependencies
library(tidyverse)


# vars/objects
data <- read.csv("midterm/data/GlobalMusicData.csv")
cleanDataDir <- "midterm/data/GlobalMusicData_clean.csv"
dirtyDataNames <- c()


# get column names
# I like for loops because it's a column name per row
for (names in names(data)) {
    print(names)
}
names(data)

# append column names to var in reverse order
for (name in names(data[23:1])) {
    dirtyDataNames <- append(name, dirtyDataNames)
}
# 
# 
# 
# name assignment ############################
dirtyDataNames #check names
dirtyDataNames <- dirtyDataNames[!dirtyDataNames %in% c( # columns we don't want
    "track_id",
    "track_name",
    "track_album_name",
    "track_album_release_date",
    "track_album_id",
    "playlist_id",
    "playlist_name",
    "track_artist"
)]
dirtyDataNames #check again
names(data) # check
data <- data[dirtyDataNames] #assign names to df
colnames(data) <- c( # change names of columns
    "TrackPopularity",
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
# summaries
str(data)
summary(data)
colSums(is.na(data))
head(data)
tail(data)

# find duplicates
duplicated(data$track_name)


# change data type of release date to "date"
as.Date(data$track_album_release_date)
str(data)


######################
# making the new csv #
######################

# check if file exists. if yes then delete and make a new one
newCsvFunc <- function() {
    if (file.exists(cleanDataDir)) {
        unlink(cleanDataDir)
        newCsvFunc()
        print(".csv file deleted")
    } else {
        data %>%
            write.csv(
                cleanDataDir,
                quote = FALSE,
                row.names = FALSE,
                sep = ",",
                fileEncoding="UTF-8"
                )
    }
    print("new .csv file created")
}
# call function
newCsvFunc()

# init
newCsv <- read.csv("midterm/data/GlobalMusicData_clean.csv")
# double check

colnames(newCsv)

str(newCsv)
head(newCsv, 1)
summary(newCsv)
