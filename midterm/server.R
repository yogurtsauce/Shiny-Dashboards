library(DT)

# server <- function(input, output) {
#     # choose columns to display
#     data2 <- data[sample(nrow(data), 1000), ]
#     output$mytable1 <- DT::renderDataTable({
#         DT::datatable(data2[, input$showVars, drop = FALSE],
#             style = "bootstrap",
#             options = list(
#                 deferRender = TRUE,
#                 scrollY = 500,
#                 scrollX = 200,
#                 scroller = TRUE
#             ),
#         )
#     }, server = FALSE)
# }
data <- read.csv("data/GlobalMusicData.csv")
server <- function(input, output, session) {
    url <- a("API reference",
        href = "https://developer.spotify.com/documentation/web-api/reference/#/",
        target = "_blank",
        rel = "noopener noreferrer"
    )
    output$link1 <- renderUI({
        tagList("You can read more about doing http pull requests here:", url)
    })



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