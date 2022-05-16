library(DT)

data <- read.csv("data/GlobalMusicData_clean.csv")



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