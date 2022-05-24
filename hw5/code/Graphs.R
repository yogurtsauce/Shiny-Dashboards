source("code/ImportData.R")


salesPerMonth <- inner_join(
    calendarDim,
    salesFact,
    by = "CalendarKey"
)

salesPerRegion <- inner_join(
    salesPersonDim,
    salesFact,
    by = "SalesPersonKey"
)

salesPerProduct <- inner_join(
    productDim,
    salesFact,
    by = "ProductKey"
)

salesPerSalesPerson <- inner_join(
    salesPersonDim,
    salesFact,
    by = "SalesPersonKey"
)

salesPerMonthGraph <- salesPerMonth %>%
    ggplot(aes(Month, DollarsSold)) +
    geom_bar(stat = "identity")

salesPerProductGraph <- salesPerProduct %>%
    ggplot(aes(Name, DollarsSold)) +
    geom_bar(stat = "identity") +
    coord_flip()

salesPerRegionGraph <- salesPerRegion %>%
    ggplot(aes(Region, DollarsSold)) +
    geom_bar(stat = "identity")

salesPerSalesPersonGraph <- salesPerSalesPerson %>%
    ggplot(aes(Name, DollarsSold)) +
    geom_bar(stat = "identity")