library(shinythemes)

source("code/ImportData.R")
source("code/Joins.R")

server <- function(input, output, session) {
    # customer table
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


    # product table
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


    # sales order table
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


    # sales person table
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


    # calendardim table
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


    # customerdim table
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


    # productdim table
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


    # salesfact table
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


    # salespersondim table
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


    # sales/month graph
    output$salesPerMonthGraph <- renderPlot(
        salesPerMonth %>%
            ggplot(aes_string(
                "Month",
                input$yVar1,
                fill = "Month"
            )) +
            geom_bar(stat = "identity")
    )


    # sales/region graph
    output$salesPerRegionGraph <- renderPlot(
        salesPerRegion %>%
            ggplot(aes_string(
                "Region",
                input$yVar2,
                fill = "Region"
            )) +
            geom_bar(stat = "identity")
    )


    # sales/product graph
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


    # sales/salesperson graph
    output$salesPerSalesPersonGraph <- renderPlot(
        salesPerSalesPerson %>%
            ggplot(aes_string(
                "SalesPersonName",
                input$yVar4,
                fill = "SalesPersonName"
            )) +
            geom_bar(stat = "identity")
    )


    # interactiveGraph
    output$interactiveGraph <- renderPlot(
        allTables %>%
            ggplot(aes_string(
                input$xVar,
                input$yVar5,
                fill = input$xVar
            )) +
            geom_histogram(stat = "identity") +
            coord_flip()
    )
}