source("code/dataprep.R")



# select count tracks and avg popularity per album
tracksPerAlbum <- sqldf("
    select count(track_name) as TracksPerAlbumCol,
    avg(track_popularity) as AverageAlbumPopularity
    from data
    group by track_album_name
    order by track_popularity desc
")

numVsPop <- renderPlot({
    print(tracksPerAlbum %>%
        ggplot(aes(TracksPerAlbumCol, AverageAlbumPopularity)) +
        geom_smooth() +
        coord_cartesian(xlim = c(0, 25), ylim = c(0, 100)) +
        ggtitle("Tracks Per Album Vs. The Popularity") +
        labs(x = "Tracks Per Album", y = "Average Album Popularity"))
})


data$track_album_release_date <- as.Date(data$track_album_release_date, format = "%d/%m/%Y")
class(data$track_album_release_date)




