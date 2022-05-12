data <- read.csv("data/GlobalMusicData.csv")

server <- function(input, output) {
# choose columns to display
    data2 <- data[sample(nrow(data), 1000), ]
    output$mytable1 <- DT::renderDataTable({
        DT::datatable(data2[, input$showVars, drop = FALSE])
    })

# sorted columns are colorized

}