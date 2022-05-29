source("Code/Libraries.R")


# introduction tab panel
introductionTab <- tabPanel(
    "Introduction",
    h1("Introduction"),
    tags$hr(style = "border-color: white;"),
)


# dependencies tab panel
dependenciesTab <- tabPanel(
    "Dependencies",
    h1("Dependencies"),
    tags$hr(style = "border-color: white;"),

    # tidyverse
    h2(tags$a(href = "https://www.tidyverse.org/", "Tidyverse")),
    tags$code("install.packages(\"tidyverse\")"),
    tags$ul(

        # list most tidyverse libraries
        tags$li(
            "A library that contains a plethora of useful libraries such as:",
            tags$ul(
                tags$li(
                    tags$a(href = "https://ggplot2.tidyverse.org/", "ggplot2"),
                    "for data visualization.",
                    br(),
                    tags$code("install.packages(\"ggplot2\")")
                ),
                tags$li(
                    tags$a(href = "https://dplyr.tidyverse.org/", "dyplyr"),
                    "for easier data manipulation.",
                    br(),
                    tags$code("install.packages(\"dplyr\")")
                ),
                tags$li(
                    tags$a(href = "https://tidyr.tidyverse.org/", "tidyr"),
                    "for easier data tidying.",
                    br(),
                    tags$code("install.packages(\"tidyr\")")
                ),
                tags$li(
                    tags$a(href = "https://readr.tidyverse.org/", "readr"),
                    "for faster data importing.",
                    br(),
                    tags$code("install.packages(\"readr\")")
                ),
                tags$li(
                    tags$a(href = "https://purrr.tidyverse.org/", "purrr"),
                    "for an easier way to work with functions and vectors.",
                    br(),
                    tags$code("install.packages(\"purrr\")")
                ),
                tags$li(
                    tags$a(href = "https://tibble.tidyverse.org/", "tibble"),
                    "for lazy data.frame management.",
                    br(),
                    tags$code("install.packages(\"tibble\")")
                ),
                tags$li(
                    tags$a(href = "https://stringr.tidyverse.org/", "stringr"),
                    "for easier string manipulation.",
                    br(),
                    tags$code("install.packages(\"stringr\")")
                ),
                tags$li(
                    tags$a(href = "https://forcats.tidyverse.org/", "forcats"),
                    "for easier handling of factors and levels.",
                    br(),
                    tags$code("install.packages(\"forcats\")")
                ),
            )
        )
    ),


    # shiny
    h2(tags$a(href = "https://shiny.rstudio.com/", "Shiny")),
    tags$code("install.packages(\"shiny\")"),
    tags$ul(
        tags$li("A framework that makes dynamic websites with R.")
    ),


    # shiny themes
    h2(tags$a(href = "https://rstudio.github.io/shinythemes/", "Shiny Themes")),
    tags$code("install.packages(\"shinythemes\")"),
    tags$ul(
        tags$li("Used for theming Shiny websites.")
    ),


    # DT
    h2(tags$a(href = "https://rstudio.github.io/DT/", "DT")),
    tags$code("install.packages(\"DT\")"),
    tags$ul(
        tags$li("An R interface to the DataTables Javascript library.")
    ),


    # rsconnect
    h2(tags$a(href = "https://rstudio.github.io/rsconnect/", "rsconnect")),
    tags$code("install.packages(\"rsconnect\")"),
    tags$ul(
        tags$li("Used for deploying my Shiny app to a website.")
    )
)


# data prep tab panel
dataPrepTab <- tabPanel(
    "Data Preparation",
    h1("Data Preparation"),
    tags$hr(style = "border-color: white;"),
)


# exploratory data analysis tab panel
exploratoryAnalysisTab <- tabPanel(
    "Exploratory Data Analysis",
    h1("Exploratory Data Analysis"),
    tags$hr(style = "border-color: white;"),
)


# visualization tab panel
visualizationTab <- tabPanel(
    "Data Visualization",
    h1("Data Visualization"),
    tags$hr(style = "border-color: white;"),
)


# Summary tab panel
summaryTab <- tabPanel(
    "Summary",
    h1("Summary"),
    tags$hr(style = "border-color: white;"),
)