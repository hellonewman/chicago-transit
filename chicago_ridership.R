### Chicago bus ridership data

df <- read.csv("CTA_-_Ridership_-_Bus_Routes_-_Daily_Totals_by_Route.csv")
head(df)
summary(df)
str(df)

library(dplyr)
library(tidyr)
library(ggplot2)

# add a column for year
# convert datestring to date format
# use format and as.POSIXlt
df$date = as.Date(df$date, "%m/%d/%Y")
df$year <- format(as.POSIXlt(df$date),"%Y")
head(df, 10)

# aggregate: sum rides on year/route/daytype
df_agg <- aggregate(rides ~year+route+daytype, data=df, sum)
head(df_agg)
df_agg$rides1000 <- df_agg$rides/1000

# df_agg$routeNo <- as.numeric(levels(df_agg$route))
#filter(df_agg, as.numeric(levels(df_agg$route)) <= 15)

route_bar <- ggplot(df_agg, aes(year, rides1000)) +
  geom_bar(stat = "identity")
route_bar

# subset for routes 10-15
route10_15<- subset(df_agg, df_agg$route %in% c('10','11','12','13','14','15'))
route_10_15_bar <- ggplot(route10_15, aes(year, rides)) +
  geom_bar(stat = "identity")
route_10_15_bar













############################## other practice ####################################
##facet!
route_10_15_bar + facet_grid(rows = vars(route))


# color by a variable
route10_15<- subset(df_agg, df_agg$route %in% c('10','11','12','13','14','15'))
route_10_15_bar <- ggplot(route10_15, aes(year, rides, fill = route)) +
  geom_bar(stat = "identity")
route_10_15_bar

# line chart 
route10_15<- subset(df_agg, df_agg$route %in% c('10','11','12','13','14','15'))
route_10_15_line <- ggplot(route10_15, aes(x = year, y = rides, group = route, colour = route)) +
  geom_line()
route_10_15_line

# axis- 1000s of rides
# color by a variable
route10_15$rides100 <- as.integer(route10_15$rides/100)
head(route10_15)
route10_15<- subset(df_agg, df_agg$route %in% c('10','11','12','13','14','15'))
route_10_15_bar <- ggplot(route10_15, aes(year, rides100, fill = route)) +
  geom_bar(stat = "identity")
route_10_15_bar

str(route10_15)
