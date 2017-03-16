install.packages("searchConsoleR")

library(googleAuthR)
library(searchConsoleR)

# Authorize script with Google Developer Console.  
## Add path to your Google Developer Console Service Account secret.json file
service_token <-gar_auth_service("C:/Users/mryap/Documents/r_search_console_secret.json")

## data in search console is reliable for 3 days ago so set start date = today - 3
## this is a single day pull so set end = start
##start <- Sys.Date() - 93
##end <- start
start <- Sys.Date() - 93
end <- Sys.Date() - 3
## set website to your URL including http://
website <- "http://digi-women.com/"

## what to download, choose between data, query, page, device, country
##download_dimensions <- c('date','query')
download_dimensions <- c('date','page','query')

## what type of Google search, choose between 'web', 'video' or 'image'
type <- c('web')

## other options available, check out ?search_analytics in the R console

## this is the query to the search console API
## rowLimit = 5000 is the max

searchquery <- search_analytics(siteURL = website,
                                startDate = start, 
                                endDate = end, 
                                dimensions = download_dimensions,
                                searchType = type, 
                                rowLimit = 100000)



## Specify Output filepath
filepath <-"C:/Users/mryap/Desktop/rdata/"

## filename will be set like searchconsoledata_2016-02-08 (.csv will be added in next step)
filename <- paste("searchconsoledata", start, sep = "_")

## the is the full filepath + filename with .csv
output <- paste(filepath, filename, ".csv", sep = "")

## this writes the sorted search query report to full filepath and filename row.names=FALSE does not write dataframe row numbers
write.csv(searchquery, output, row.names = FALSE)