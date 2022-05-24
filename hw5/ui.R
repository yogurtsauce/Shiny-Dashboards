library(DT)
library(shinythemes)

pageOne <- tabPanel(
    "Introduction",
    h1("Introduction"),
    tags$hr(style = "border-color: white;"),
    p(
        "This project demonstrates taking an operational database and turning
        it into a data warehouse using a star schema. The operational database
        was created and populated using SQL. I then used SQL to create the
        tables for the star schema and populated them."
    ),
    tags$a(
        href = "https://github.com/yogurtsauce/Shiny-Dashboards/tree/master/hw5", # nolint
        "Source Code"
    )
)


pageTwo <- tabPanel(
    "Visualization"
)


pageThree <- tabPanel(
    "Operational Tables",
    tabsetPanel(
        tabPanel("Customer", dataTableOutput("customerTable")),
        tabPanel("Product", dataTableOutput("productTable")),
        tabPanel("SalesOrder", dataTableOutput("salesOrderTable")),
        tabPanel("SalesPerson", dataTableOutput("salesPersonTable"))
    )
)


pageFour <- tabPanel(
    "Data Warehouse Tables",
    tabsetPanel(
        tabPanel("CalendarDim", dataTableOutput("calendarDimTable")),
        tabPanel("CustomerDim", dataTableOutput("customerDimTable")),
        tabPanel("ProductDim", dataTableOutput("productDimTable")),
        tabPanel("SalesFact", dataTableOutput("salesFactTable")),
        tabPanel("SalesPersonDim", dataTableOutput("salesPersonDimTable"))
    )
)


ui <- navbarPage(
    theme = shinytheme("darkly"),
    "Nicholas' Hw5",
    pageOne,
    pageTwo,
    pageThree,
    pageFour
)