server <- function(input, output) {
    #
}

output$plot <- renderPlot({
    ggplot(data = characters, aes_string())
})