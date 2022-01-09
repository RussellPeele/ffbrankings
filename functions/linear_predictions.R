library(tidyverse)
library(plyr)

projected.2014 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-weekly-projections.2014.csv", header=TRUE, stringsAsFactors=FALSE)
  projected.2014.yr = mutate((projected.2014),
                           year = 2014,
                           actual = "no")


projected.2015 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-weekly-projections.2015.csv", header=TRUE, stringsAsFactors=FALSE)
  projected.2015.yr = mutate((projected.2015),
                           year = 2015,
                           actual = "no")

projected.2016 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-weekly-projections.2016.csv", header=TRUE, stringsAsFactors=FALSE)
  projected.2016.yr = mutate((projected.2016),
                           year = 2016,
                           actual = "no")

projected.2017 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-weekly-projections.2017.csv", header=TRUE, stringsAsFactors=FALSE)
  projected.2017.yr = mutate((projected.2017),
                           year = 2017,
                           actual = "no")

projected.2018 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-weekly-projections.2018.csv", header=TRUE, stringsAsFactors=FALSE)
  projected.2018.yr = mutate((projected.2018),
                           year = 2018,
                           actual = "no")

projected.2019 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-weekly-projections.2019.csv", header=TRUE, stringsAsFactors=FALSE)
  projected.2019.yr = mutate((projected.2019),
                           year = 2019,
                           actual = "no")

projected.2020 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-weekly-projections.2020.csv", header=TRUE, stringsAsFactors=FALSE)
  projected.2020.yr = mutate((projected.2020),
                           year = 2020,
                           actual = "no")

actual.2014 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-leaders.2014.csv", header=TRUE, stringsAsFactors=FALSE)
#view(projected.2014)
  actual.2014.yr =  mutate((actual.2014),
                         year = 2014,
                         actual = "yes")

actual.2015 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-leaders.2015.csv", header=TRUE, stringsAsFactors=FALSE)
  actual.2015.yr =  mutate((actual.2015),
                         year = 2015,
                         actual = "yes")

actual.2016 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-leaders.2016.csv", header=TRUE, stringsAsFactors=FALSE)
    actual.2016.yr =  mutate((actual.2016),
                         year = 2016,
                         actual = "yes")

actual.2017 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-leaders.2017.csv", header=TRUE, stringsAsFactors=FALSE)
    actual.2017.yr =  mutate((actual.2017),
                         year = 2017,
                         actual = "yes")

actual.2018 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-leaders.2018.csv", header=TRUE, stringsAsFactors=FALSE)
#view(projected.2014)
  actual.2018.yr =  mutate((actual.2018),
                         year = 2018,
                         actual = "yes")

actual.2019<- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-leaders.2019.csv", header=TRUE, stringsAsFactors=FALSE)
    actual.2019.yr =  mutate((actual.2019),
                         year = 2019,
                         actual = "yes")

actual.2020 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-leaders.2020.csv", header=TRUE, stringsAsFactors=FALSE)
    actual.2020.yr =  mutate((actual.2020),
                         year = 2020,
                         actual = "yes")

Superflex.complete = rbind(projected.2014.yr, actual.2014.yr, projected.2015.yr, actual.2015.yr, projected.2016.yr, actual.2016.yr, projected.2017.yr, actual.2017.yr, projected.2018.yr, actual.2018.yr, projected.2019.yr, actual.2019.yr, projected.2020.yr, actual.2020.yr)
  
save(Superflex.complete, file = "superflexcomplete_data_frame.Rda")  

load(file='superflexcomplete_data_frame.Rda')

linear_prediction = function(position_var, var_1)
  
{
  library(tidyverse)
   library(magrittr)
  
  load("superflexcomplete_data_frame.rda")
  
  Superflex.complete.1 = Superflex.complete |>
    mutate(NameYr = paste0(Name, " (", year, ")")) |>
    filter(Position == position_var)
  
  
  
  proj = Superflex.complete.1 |>
    
    filter(actual == "no") |>
    
    select(NameYr, var_1)
  
  
  
  actual = Superflex.complete.1 |>
    
    filter(actual == "yes") |>
    
    select(NameYr, FantasyPoints)
  
  
  
  full = inner_join(proj, actual, by = "NameYr") |>
    
    set_colnames(c("name", "predictor_variable", "actual_fantasy_pts"))
  
  
  
  model = lm(actual_fantasy_pts ~ predictor_variable,
             
             data = full)
  
  
  
 linear.table =  summary(model) # model predicts actual fantasy pts based on projected passing tds
  
  
  
  
  
  message= paste("Linear regression between projected", var_1, "and Season Point Total for:", position_var)
  
  return(list(message, linear.table))
  




}

























