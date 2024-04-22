#install.packages("googlesheets4")
library(googlesheets4)

gs4_deauth()

gs4_auth()

gs4_auth_token()

gs4_create("test_sheet")

#read spreed sheet data
gsheet_key <- ""
tmp <- read_sheet(gsheet_key, sheet=1)

# write in Google sheet / populate with data
dta <- data.frame(x=rnorm(10), y=rnorm(10))

sheet_write(dta, gsheet_key, sheet="Poland")
#append the sheet
sheet_append(gsheet_key, dta, sheet="Poland")

new_colum <- data.frame(z=rnorm(10))
range_write(gsheet_key, new_colum, sheet="Poland", range="J") # range to kolumna do której wstawiamy dane

# Clear range
range_clear(gsheet_key, sheet="Poland", range="J")
range_clear(gsheet_key, sheet="Poland", range="A:G")