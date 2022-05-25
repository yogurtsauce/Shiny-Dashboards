source("code/ImportData.R")
source("ui.R")


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

allTables <- salesFact %>%
    inner_join(calendarDim, by = "CalendarKey") %>%
    inner_join(customerDim, by = "CustomerKey") %>%
    inner_join(productDim, by = "ProductKey") %>%
    inner_join(salesPersonDim, by = "SalesPersonKey")

