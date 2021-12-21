library(tidyverse)
library(plyr)

projected.2014 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-weekly-projections.2014.csv", header=TRUE, stringsAsFactors=FALSE)

projected.2014.new = select(projected.2014, Rank, Name, Position, FantasyPointsPerGame, FantasyPoints)


projected.2014.yr = mutate((projected.2014.new),
                           year = 2014,
                           actual = "no")


projected.2015 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-weekly-projections.2015.csv", header=TRUE, stringsAsFactors=FALSE)

projected.2015.new = select(projected.2015, Rank, Name, Position, FantasyPointsPerGame, FantasyPoints)

projected.2015.yr = mutate((projected.2015.new),
                           year = 2015,
                           actual = "no")

projected.2016 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-weekly-projections.2016.csv", header=TRUE, stringsAsFactors=FALSE)

projected.2016.new = select(projected.2016, Rank, Name, Position, FantasyPointsPerGame, FantasyPoints)

projected.2016.yr = mutate((projected.2016.new),
                           year = 2016,
                           actual = "no")


projected.2017 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-weekly-projections.2017.csv", header=TRUE, stringsAsFactors=FALSE)

projected.2017.new = select(projected.2017, Rank, Name, Position, FantasyPointsPerGame, FantasyPoints)

projected.2017.yr = mutate((projected.2017.new),
                           year = 2017,
                           actual = "no")

projected.2018 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-weekly-projections.2018.csv", header=TRUE, stringsAsFactors=FALSE)

projected.2018.new = select(projected.2018, Rank, Name, Position, FantasyPointsPerGame, FantasyPoints)

projected.2018.yr = mutate((projected.2018.new),
                           year = 2018,
                           actual = "no")

projected.2019 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-weekly-projections.2019.csv", header=TRUE, stringsAsFactors=FALSE)

projected.2019.new = select(projected.2019, Rank, Name, Position, FantasyPointsPerGame, FantasyPoints)

projected.2019.yr = mutate((projected.2019.new),
                           year = 2019,
                           actual = "no")

projected.2020 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-weekly-projections.2020.csv", header=TRUE, stringsAsFactors=FALSE)

projected.2020.new = select(projected.2020, Rank, Name, Position, FantasyPointsPerGame, FantasyPoints)

projected.2020.yr = mutate((projected.2020.new),
                           year = 2020,
                           actual = "no")




actual.2014 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-leaders.2014.csv", header=TRUE, stringsAsFactors=FALSE)
#view(projected.2014)

actual.2014.new = select(actual.2014, Rank, Name, Position, FantasyPointsPerGame, FantasyPoints)

actual.2014.yr =  mutate((actual.2014.new),
                         year = 2014,
                         actual = "yes")

actual.2015 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-leaders.2015.csv", header=TRUE, stringsAsFactors=FALSE)


actual.2015.new = select(actual.2015, Rank, Name, Position, FantasyPointsPerGame, FantasyPoints)

actual.2015.yr =  mutate((actual.2015.new),
                         year = 2015,
                         actual = "yes")

actual.2016 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-leaders.2016.csv", header=TRUE, stringsAsFactors=FALSE)


actual.2016.new = select(actual.2016, Rank, Name, Position, FantasyPointsPerGame, FantasyPoints)

actual.2016.yr =  mutate((actual.2016.new),
                         year = 2016,
                         actual = "yes")

actual.2017 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-leaders.2017.csv", header=TRUE, stringsAsFactors=FALSE)


actual.2017.new = select(actual.2017, Rank, Name, Position, FantasyPointsPerGame, FantasyPoints)

actual.2017.yr =  mutate((actual.2017.new),
                         year = 2017,
                         actual = "yes")

actual.2018 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-leaders.2018.csv", header=TRUE, stringsAsFactors=FALSE)
#view(projected.2014)

actual.2018.new = select(actual.2018, Rank, Name, Position, FantasyPointsPerGame, FantasyPoints)

actual.2018.yr =  mutate((actual.2018.new),
                         year = 2018,
                         actual = "yes")

actual.2019<- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-leaders.2019.csv", header=TRUE, stringsAsFactors=FALSE)


actual.2019.new = select(actual.2019, Rank, Name, Position, FantasyPointsPerGame, FantasyPoints)

actual.2019.yr =  mutate((actual.2019.new),
                         year = 2019,
                         actual = "yes")

actual.2020 <- read.csv("C:\\users\\17205\\Downloads\\Data.Science.final.project\\fantasy-football-leaders.2020.csv", header=TRUE, stringsAsFactors=FALSE)


actual.2020.new = select(actual.2020, Rank, Name, Position, FantasyPointsPerGame, FantasyPoints)

actual.2020.yr =  mutate((actual.2020.new),
                         year = 2020,
                         actual = "yes")



Superflex.data = rbind(projected.2014.yr, actual.2014.yr, projected.2015.yr, actual.2015.yr, projected.2016.yr, actual.2016.yr, projected.2017.yr, actual.2017.yr, projected.2018.yr, actual.2018.yr, projected.2019.yr, actual.2019.yr, projected.2020.yr, actual.2020.yr)

Superflex.complete = rbind(projected.2014.yr, actual.2014.yr, projected.2015.yr, actual.2015.yr, projected.2016.yr, actual.2016.yr, projected.2017.yr, actual.2017.yr, projected.2018.yr, actual.2018.yr, projected.2019.yr, actual.2019.yr, projected.2020.yr, actual.2020.yr)



aaron.rodgers.projected = filter(Superflex.data, Name== "Aaron Rodgers", actual=="no")
aaron.rodgers.actual = filter(Superflex.data, Name== "Aaron Rodgers", actual=="yes")

frank.gore.projected = filter(Superflex.data, Name== "Frank Gore", actual=="no")
frank.gore.actual = filter(Superflex.data, Name== "Frank Gore", actual=="yes")

ggp <- ggplot(NULL, aes(x=year, y=Rank)) +    # Draw ggplot2 plot based on two data frames
  geom_line(data = frank.gore.projected, col = "red") +
  geom_line(data = frank.gore.actual, col = "blue")


return(ggp)                                 # Draw plot

# setwd("C:/Users/... Your Path .../Desktop/")     Set working directory

save(Superflex.data, file = "superflex_data_frame.Rda")  

#Load complete data set
load(file='superflex_data_frame.Rda')

ggplot(data = aaron.rodgers.projected)+
  geom_point(mapping = aes(x = year, y = Rank))

ggplot(data = aaron.rodgers.actual)+
  geom_point(mapping = aes(x = year, y = Rank))

ggp <- ggplot(NULL, aes(x=year, y=Rank)) +    # Draw ggplot2 plot based on two data frames
  geom_line(data = aaron.rodgers.projected, col = "red") +
  geom_line(data = aaron.rodgers.actual, col = "blue")
ggp                                 # Draw plot



adrian.peterson.projected = filter(Superflex.data, Name== "Adrian Peterson", actual=="no")
adrian.peterson.actual = filter(Superflex.data, Name== "Adrian Peterson", actual=="yes")

ggplot(data = adrian.peterson.projected)+
  geom_point(mapping = aes(x = year, y = Rank))

ggplot(data = adrian.peterson.actual)+
  geom_point(mapping = aes(x = year, y = Rank))

ggp <- ggplot(NULL, aes(x=year, y=Rank)) +    # Draw ggplot2 plot based on two data frames
  geom_line(data = adrian.peterson.projected, col = "red") +
  geom_line(data = adrian.peterson.actual, col = "blue")
ggp                                 # Draw plot





#####################


Superflex.new = Superflex.data |>
  
  select(Rank, Name, Position, year, actual) |>
  
  pivot_wider(everything(),
              
              names_from = "actual",
              
              values_from = "Rank",
              
              values_fn = mean) |>
  
  mutate(Rank_Differential = abs(yes - no)) |>
  
  filter(!is.na(Rank_Differential))

##################### ACTUAL Builds Rank differential set 

top200 = filter(Superflex.data, Rank <=70 & actual == "no" | actual =="yes"  )

Superflex.rank.diff = top200

df_2 = top200 |>
  
  pivot_wider(!c(FantasyPointsPerGame, FantasyPoints),
              
              names_from = "actual",
              
              values_from = "Rank",
              
              values_fn = mean) |>
  
  mutate(Rank_Differential = abs(yes - no)) |>
  
  filter(!is.na(Rank_Differential)) |>
  
  select(Name, year, Rank_Differential)


Superflex.rank.diff = top200 |>
  
  left_join(df_2, by = c("Name", "year"))


######


  
Superflex.rank.diff.filtered =  filter(Superflex.rank.diff, !is.na(Rank_Differential))

 

by_position <- group_by(Superflex.rank.diff.filtered, Position)

summarize(by_position, rank.diff = median(Rank_Differential))
  




 
 
