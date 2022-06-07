# load the libraries #
source("code/importdata.R")
source("code/libraries.R")


# viewing the data #
# glimpse(data)
# class(data)
# glimpse(data)
# summary(data)


# find nulls function #
findNulls <- function(nameOfDataset) { # nolint
    if (sum(is.na(nameOfDataset)) != 0) {
        nameOfDataset %>%
            summarise_all(~ sum(is.na(.))) %>%
            select_if(. > 0)
    } else {
        print("There are no nulls.")
    }
}
findNulls(data)


# find duplicates #
findNumDupe <- data %>%
    filter(duplicated(track_id)) %>%
    arrange(track_name) %>%
    select(track_name, track_popularity) %>%
    tally()

findNumDupe <- sprintf("There are %s duplicate rows.", findNumDupe)

findNumDupe


# for all duplicates, keep the one with the highest popularity. #
# https://stackoverflow.com/questions/24011246/deleting-rows-that-are-duplicated-in-one-column-based-on-the-conditions-of-anoth
data <- data %>%
    arrange(track_id, -track_popularity) %>%
    filter(duplicated(track_id) == FALSE)

sprintf("There are now %s rows after removing the duplicates.", count(data))
findNumDupe


# checking to see if there are any dates that aren't in the right format
sqldf("
    select track_album_release_date
    from data
    where length(track_album_release_date) < 6
    limit 5
")





# select which columns I want
data <- sqldf("
select
track_name,
track_artist,
track_popularity,
track_album_name,
track_album_release_date,
playlist_name,
playlist_genre,
playlist_subgenre,
danceability,
energy,
key,
loudness,
mode,
speechiness,
acousticness,
instrumentalness,
liveness,
valence,
tempo,
duration_ms

from data
")
