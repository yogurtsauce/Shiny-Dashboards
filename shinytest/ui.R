characters <- read.csv("data/characters.csv")

intro_panel <- tabPanel(
    "Introduction",
    titlePanel("Introduction"),
    p("Put stuff here that will introduce the user")
)

select_values <- colnames(characters)
select_values <- select_values[!select_values %in% c("Character", "Class")]

sidebar_content <- sidebarPanel(
    selectInput(
        "y_var",
        label = "Y Variable",
        choices = select_values
    )
)

main_content <- mainPanel(
    plotOutput("plot")
)

second_panel <- tabPanel(
    "Graph",
    titlePanel("Click for graph stuff"),
    sidebarLayout(sidebar_content, main_content)
)

ui <- navbarPage(
    "Nicholas' Test Page",
    intro_panel,
    second_panel
)