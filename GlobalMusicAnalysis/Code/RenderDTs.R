source("Code/Libraries.R")

renderOGDT <- renderDT(
    data,
    style = "bootstrap",
    filter = "top",
    extensions = "Buttons",
    options = list(
        deferRender = TRUE,
        dom = "Bfrtip",
        scrollX = "400px",
        scrollY = "400px",
        buttons = list("colvis", "print", list(
            extend = "collection",
            buttons = c("csv", "excel", "pdf"),
            text = "Download"
        ))
    )
)