data <- read.csv("data/GlobalMusicData.csv")

server <- function(input, output) {
    # choose columns to display
    data2 <- data[sample(nrow(data), 1000), ]
    output$mytable1 <- DT::renderDataTable({
        DT::datatable(
            data2[, input$showVars, drop = FALSE],
            style = "bootstrap",
            options = list(
                deferRender = TRUE,
                scrollY = 500,
                scrollX = 200,
                scroller = TRUE
            )
        )
    })
}