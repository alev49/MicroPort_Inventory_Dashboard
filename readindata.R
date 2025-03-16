library(dplyr)
library(tibble)
stockData <- readxl::read_xlsx("/Users/alexvidal/Documents/MicroPort/DAILY PLANNING 3-5-2025.xlsx",
                               sheet="Office Loaners- Stock")

backOrderData <- readxl::read_xlsx("/Users/alexvidal/Documents/MicroPort/DAILY PLANNING 3-5-2025.xlsx",
                               sheet="Backorders")

scheduleData <- readxl::read_xlsx("/Users/alexvidal/Documents/MicroPort/DAILY PLANNING 3-5-2025.xlsx",
                               sheet="Schedule",col_names = FALSE)

summary(stockData)
summary(backOrderData)
summary(scheduleData)



# TODO:
# Clean up scheduleData to to only have date as its id_rows

schedule<- scheduleData |> 
  slice_tail(n=-2) |> 
    filter(!is.na(...2) , ...2 != "Case Number") |> 
      rename_all(~(as.character(scheduleData[2,])))

schedule$`Event Date` <- as.Date(schedule$`Event Date`, format = "%m/%d/%y")

stock <- stockData |>
  filter(!is.na(`Home Location`))
        
backOrders <- backOrderData |>
  filter(!is.na(`Item Number`)) |>
    rename(`Ship To Hospital` = `Ship To Number...5`) |>
      rename(`Ship To Number` = `Ship To Number...4`)






