library(shinythemes)

source("code/ImportData.R")
source("code/Graphs.R")

server <- function(input, output, session) {
    output$customerTable <- renderDT(
        customer,
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


    output$productTable <- renderDT(
        product,
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


    output$salesOrderTable <- renderDT(
        salesOrder,
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


    output$salesPersonTable <- renderDT(
        salesPerson,
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


    output$calendarDimTable <- renderDT(
        calendarDim,
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


    output$customerDimTable <- renderDT(
        customerDim,
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


    output$productDimTable <- renderDT(
        productDim,
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


    output$salesFactTable <- renderDT(
        salesFact,
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


    output$salesPersonDimTable <- renderDT(
        salesPersonDim,
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


    output$salesPerMonthGraph <- renderPlot(
        salesPerMonth %>%
            ggplot(aes_string(
                "Month",
                input$yVar1,
                fill = "Month"
            )) +
            geom_bar(stat = "identity")
    )

    output$salesPerRegionGraph <- renderPlot(
        salesPerRegion %>%
            ggplot(aes_string(
                "Region",
                input$yVar2,
                fill = "Region"
            )) +
            geom_bar(stat = "identity")
    )

    output$salesPerProductGraph <- renderPlot(
        salesPerProduct %>%
            ggplot(aes_string(
                "ProductName",
                input$yVar3,
                fill = "ProductName"
            )) +
            geom_bar(stat = "identity") +
            coord_flip()
    )

    output$salesPerSalesPersonGraph <- renderPlot(
        salesPerSalesPerson %>%
            ggplot(aes_string(
                "SalesPersonName",
                input$yVar4,
                fill = "SalesPersonName"
            )) +
            geom_bar(stat = "identity")
    )
}