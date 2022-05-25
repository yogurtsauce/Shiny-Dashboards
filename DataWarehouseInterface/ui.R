library(DT)
library(shinythemes)

source("code/ImportData.R")

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
    p(
        "You can view visualizations, operational tables, and the data warehouse
        tables in their respective tabs."
    ),
    tags$a(
        href = "https://github.com/yogurtsauce/Shiny-Dashboards/tree/master/hw5", # nolint
        "Source Code"
    )
)


ychoices <- c("DollarsSold", "QuantitySold")
xchoices <- c("Month", "Region", "ProductName", "SalesPersonName")

pageTwo <- tabPanel(
    "Visualization",
    tabsetPanel(
        tabPanel(
            "Sales / Month",
            sidebarLayout(
                sidebarPanel(
                    selectInput(
                        "yVar1",
                        label = "Y Variable:",
                        choices = ychoices
                    ),
                    width = 2
                ),
                mainPanel(
                    plotOutput("salesPerMonthGraph")
                )
            )
        ),
        tabPanel(
            "Sales / Region",
            sidebarLayout(
                sidebarPanel(
                    selectInput(
                        "yVar2",
                        label = "Y Variable:",
                        choices = ychoices
                    ),
                    width = 2
                ),
                mainPanel(
                    plotOutput("salesPerRegionGraph")
                )
            )
        ),
        tabPanel(
            "Sales / Product",
            sidebarLayout(
                sidebarPanel(
                    selectInput(
                        "yVar3",
                        label = "Y Variable:",
                        choices = ychoices
                    ),
                    width = 2
                ),
                mainPanel(
                    plotOutput("salesPerProductGraph")
                )
            )
        ),
        tabPanel(
            "Sales / Sales Person",
            sidebarLayout(
                sidebarPanel(
                    selectInput(
                        "yVar4",
                        label = "Y Variable:",
                        choices = ychoices
                    ),
                    width = 2
                ),
                mainPanel(
                    plotOutput("salesPerSalesPersonGraph")
                )
            )
        ),
        tabPanel(
            "Interactive Table",
            sidebarLayout(
                sidebarPanel(
                    selectInput(
                        "yVar5",
                        label = "Y Variable:",
                        choices = ychoices
                    ),
                    selectInput(
                        "xVar",
                        label = "X Variable:",
                        choices = xchoices
                    ),
                    width = 3
                ),
                mainPanel(
                    plotOutput("interactiveTable")
                )
            )
        )
    )
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
    "Nicholas' Data Warehouse Project",
    pageOne,
    pageTwo,
    pageThree,
    pageFour
)