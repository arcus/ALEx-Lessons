#################################################################################################
library(RCurl)

confirm1a <- getURL("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")

confirmed1 <- read.csv(text = confirm1a, stringsAsFactors = FALSE )
names(confirmed1) <- tolower(names(confirmed1))

death1a <- getURL("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv")

deaths1 <- read.csv(text = death1a, stringsAsFactors = FALSE )
names(deaths1) <- tolower(names(deaths1))

recovered1a <- getURL("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv")

recovered1 <- read.csv( text = recovered1a, stringsAsFactors = FALSE )
names(recovered1) <- tolower(names(recovered1))

#confirmed1 <- read.csv( "confirmed3-28-2020.csv", header = TRUE )
#deaths1 <- read.csv( "deaths3-28-2020.csv", header = TRUE )
#recovered1 <- read.csv( "recovered3-28-2020.csv", header = TRUE )

#table( confirmed1$country.region )

#confirmed1[ confirmed1$country.region == "China", 1:10 ]

#confirmed1[ confirmed1$country.region == "US", 1:10 ]

#sort( table( confirmed1$country.region ) )

name1 <- names( confirmed1 )

x1 <- strsplit( name1[5], "\\." )[[1]]
x2b <- x1[2]
x2a <- substr( x1[1],2,2)

dateout1 <- ISOdate( 2020, x2a, x2b )

nperiod1 <- length( name1 )

for( i in 6:nperiod1 ){
      x1 <- strsplit( name1[i], "\\." )[[1]]
      x2b <- x1[2]
      x2a <- substr( x1[1],2,2)
      dateout1 <- c( dateout1, ISOdate( 2020, x2a, x2b ) )
}

# Fix Canada since there is discrepancy in the number of
# rows.
confirmed1canada <- confirmed1[ confirmed1$country.region == "Canada", ]
deaths1canada <- deaths1[ deaths1$country.region == "Canada", ]
recovered1Canada <- recovered1[ recovered1$country.region == "Canada", ]

# Roll up the totals for the entire country.
canada1confix <- data.frame(province.state = "",
                            country.region = unique( confirmed1canada$country.region),
                            lat = unique( recovered1Canada$lat ),
                            long = unique( recovered1Canada$long ),
                            x1 = t(apply( confirmed1canada[,5:ncol(confirmed1canada)],
                                          2, sum) ) )
names( canada1confix ) <- names( confirmed1canada )

canada1dfix <- data.frame(province.state = "",
                          country.region = unique( deaths1canada$country.region),
                          lat = unique( recovered1Canada$lat ),
                          long = unique( recovered1Canada$long ),
                          x1 = t(apply( deaths1canada[,5:ncol(deaths1canada)],
                                        2, sum) ) )
names( canada1dfix ) <- names( deaths1canada )

confirmed1b <- confirmed1[ confirmed1$country.region != "Canada", ]
deaths1b <- deaths1[ deaths1$country.region != "Canada", ]
confirmed1c <- rbind( confirmed1b, canada1confix )
deaths1c <- rbind( deaths1b, canada1dfix )

tcr1 <- table(confirmed1c$country.region) - table( recovered1$country.region )
tdr1 <- table(deaths1c$country.region) - table( recovered1$country.region )
length( tcr1[ tcr1 > 0] )
length( tdr1[ tdr1 > 0] )

confirmed1 <- confirmed1c
deaths1 <- deaths1c

i <- 1
n1col <- ncol( confirmed1 )
country1 <- confirmed1$country.region[i]
prov1 <- confirmed1$province.state[i]
lat1 <- confirmed1$lat[ confirmed1$province.state == prov1 &
                              confirmed1$country.region == country1 ]
long1 <- confirmed1$long[ confirmed1$province.state == prov1 &
                                confirmed1$country.region == country1 ]
con1 <- confirmed1[ confirmed1$province.state == prov1 &
                          confirmed1$country.region == country1, 5:n1col ]
dea1 <- deaths1[ deaths1$province.state == prov1 &
                       deaths1$country.region == country1, 5:n1col ]
rec1 <- recovered1[ recovered1$province.state == prov1 &
                          recovered1$country.region == country1, 5:n1col ]
newdata1 <- data.frame( prov.state = rep( prov1, length = length( 5:nperiod1 )),
                        country = rep( country1, length = length( 5:nperiod1 )),
                        lat = rep( lat1, length = length( 5:nperiod1 )),
                        long = rep( long1, length = length( 5:nperiod1 )),
                        date = dateout1,
                        confirmed = t(con1),
                        deaths = t(dea1),
                        recovered = t(rec1)
)
names( newdata1 ) <- c( "prov.state",
                        "country",
                        "lat",
                        "long",
                        "date",
                        "confirmed",
                        "deaths",
                        "recovered")


for( i in 2:nrow( confirmed1 ) ){
      n1col <- ncol( confirmed1 )
      country1 <- confirmed1$country.region[i]
      prov1 <- confirmed1$province.state[i]
      lat1 <- confirmed1$lat[ confirmed1$province.state == prov1 &
                                    confirmed1$country.region == country1 ]
      long1 <- confirmed1$long[ confirmed1$province.state == prov1 &
                                      confirmed1$country.region == country1 ]
      con1 <- confirmed1[ confirmed1$province.state == prov1 &
                                confirmed1$country.region == country1,
                          5:n1col ]
      dea1 <- deaths1[ deaths1$province.state == prov1 &
                             deaths1$country.region == country1,
                       5:n1col ]
      rec1 <- recovered1[ recovered1$province.state == prov1 &
                                recovered1$country.region == country1,
                          5:n1col ]
      newdata2 <- data.frame( prov.state = rep( prov1, length = length( 5:nperiod1 )),
                              country = rep( country1, length = length( 5:nperiod1 )),
                              lat = rep( lat1, length = length( 5:nperiod1 )),
                              long = rep( long1, length = length( 5:nperiod1 )),
                              date = dateout1,
                              confirmed = t(con1),
                              deaths = t(dea1),
                              recovered = t(rec1)
      )
      names( newdata2 ) <- c( "prov.state",
                              "country",
                              "lat",
                              "long",
                              "date",
                              "confirmed",
                              "deaths",
                              "recovered")
      newdata1 <- rbind( newdata1, newdata2 )
}




write.csv( newdata1,
           paste("Covid19-", Sys.Date(),".csv", sep = ""),
           row.names = FALSE )

library(dplyr)

tib <- as_tibble(newdata1)

ustib <- tib %>%
      filter(country == "US")
