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
