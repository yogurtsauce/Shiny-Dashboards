source("Code/Libraries.R")
# introduction tab panel
introduction <- tabPanel(
    "Introduction",
    h1("Introduction"),
    tags$hr(style = "border-color: white;"),
)


# dependencies tab panel
dependencies <- tabPanel(
    "Dependencies",
    h1("Dependencies"),
    tags$hr(style = "border-color: white;"),
)


# data prep tab panel
dataPrep <- tabPanel(
    "Data Preparation",
    h1("Data Preparation"),
    tags$hr(style = "border-color: white;"),
)


# descriptive data analysis tab panel
descriptiveAnalysis <- tabPanel(
    "Descriptive Data Analysis",
    h1("Descriptive Data Analysis"),
    tags$hr(style = "border-color: white;"),
)


# exploratory data analysis tab panel
exploratoryAnalysis <- tabPanel(
    "Exploratory Data Analysis",
    h1("Exploratory Data Analysis"),
    tags$hr(style = "border-color: white;"),
)


# Summary tab panel
summary <- tabPanel(
    "Summary",
    h1("Summary"),
    tags$hr(style = "border-color: white;"),
)