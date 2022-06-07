# load the libraries ##########################################################

source("main.R")


server <- function(input, output) {
    # render the original data set DT
    output$originalData <- datatableTemplate((ogData))

    # render the data summary
    output$dataSummary <- datatableTemplate2((dataDescriptionTable))

    # render the clean dataset
    output$cleanData <- datatableTemplate((data))

    # render top 5
    output$top5 <- datatableTemplate2(top5Data)

    # render bot 5
    output$bot5 <- datatableTemplate2(bot5Data)

    # render track/album vs popularity
    output$numTrackPlot <- numVsPop

    # render genre over time
    genreGroup <- reactive({
        input$genreInput
    })

    output$genreOverTime <- renderPlot({
        data %>%
            ggplot(aes_string(
                "track_album_release_date",
                "track_popularity",
                group = genreGroup()
            )) +
            geom_smooth(aes_string(color = genreGroup()),
                se = F,
                k = 1,
                method = "gam"
            ) +
            scale_x_date(
                date_breaks = "5 years",
                date_labels = "%Y",
                limits = as.Date(c(input$genreDateInput1, input$genreDateInput2))
            ) +
            ggtitle("Genre Popularities Over Time") +
            labs(x = "Years", y = "Popularity")
    })


    # render popularity vs factors
    output$popularityFactors <- renderPlot({
        data %>%
            ggplot(aes_string(input$popularityInput, "track_popularity")) +
            geom_jitter(alpha = .25) +
            geom_smooth() +
            ggtitle("Popularity vs Factors") +
            labs(x = input$popularityInput, y = "Popularity")
    })
}