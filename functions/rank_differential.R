# manipulates data set to return differential between player, position, 

library(ggplot2)
library(dplyr)

load(file='Superflex_data_frame.Rda')



#takes in position and grouping - top 100, top 50, top 20
rank_differential=function(year_start, year_end, top.echelon)
{
  
  #Builds Rank differential column 
  
  top200 = filter(Superflex.data, Rank <= top.echelon & actual == "no" | actual =="yes"  )|>
    filter(year >= year_start) %>%
    filter(year <= year_end)
  
  Superflex.rank.diff = top200
  
  
  #Superflex.rank.diff = Superflex.data
  
  df_2 = top200 |>
    
    pivot_wider(!c(FantasyPointsPerGame, FantasyPoints),
                
                names_from = "actual",
                
                values_from = "Rank",
                
                values_fn = mean) |>
    
    mutate(Rank_Differential = abs(yes - no)) |>
    
    filter(!is.na(Rank_Differential)) |>
    
    select(Name, year, Rank_Differential)
  
  
 # Superflex.rank.diff = Superflex.rank.diff |>
    
  #  left_join(df_2, by = c("Name", "year"))
  
  
  Superflex.rank.diff = top200 |>
    
    left_join(df_2, by = c("Name", "year"))
  
  
  ######
  
  
  
  Superflex.rank.diff.filtered =  filter(Superflex.rank.diff, !is.na(Rank_Differential))
  
  by_position <- group_by(Superflex.rank.diff.filtered, Position)
  
  table = summarize(by_position, rank.diff = mean(Rank_Differential))
  
  message = "Positional Rank Consistency"
  
  return(list(message, table))
  
}

point_differential = function(year_start, year_end, top.echelon)
{
 
  
  top200 = filter(Superflex.data, FantasyPoints >= top.echelon & actual == "no" | actual =="yes"  )|>
    filter(year >= year_start) %>%
    filter(year <= year_end)
  
  Superflex.point.diff = top200
  
  
  Superflex.point.diff = Superflex.data
  
  df_2 = top200 |>
    
    pivot_wider(!c(Rank, FantasyPointsPerGame),
                
                names_from = "actual",
                
                values_from = "FantasyPoints",
                
                values_fn = mean) |>
    
    mutate(Point_Differential = abs(yes - no)) |>
    
    filter(!is.na(Point_Differential)) |>
    
    select(Name, year, Point_Differential)
  
  
#  Superflex.point.diff = Superflex.rank.diff |>
    
 #   left_join(df_2, by = c("Name", "year"))
  
  
  Superflex.point.diff = top200 |>
    
    left_join(df_2, by = c("Name", "year"))
  
  
  ######
  
  
  
  Superflex.point.diff.filtered =  filter(Superflex.point.diff, !is.na(Point_Differential))
  
  by_position <- group_by(Superflex.point.diff.filtered, Position)
  
  table = summarize(by_position, point.diff = mean(Point_Differential))
  
  message = "Positional Season Total Consistency"
  
  return(list(message, table))
  
}
  
############# Point Per Game Analysis, arguably the most important

ppg_differential = function(year_start, year_end, top.echelon)
{
  #Builds Rank differential column 
  
  top200 = filter(Superflex.data, FantasyPointsPerGame >= top.echelon & actual == "no"  | actual =="yes"  )|>
    filter(year >= year_start) %>%
    filter(year <= year_end)
  
  Superflex.ppg.diff = top200
  
  
  #Superflex.ppg.diff = Superflex.data
  
  df_3 = top200 |>
    
    pivot_wider(!c(Rank, FantasyPoints),
                
                names_from = "actual",
                
                values_from = "FantasyPointsPerGame",
                
                values_fn = mean) |>
    
    mutate(ppg_Differential = abs(yes - no)) |>
    
    filter(!is.na(ppg_Differential)) |>
    
    select(Name, year, ppg_Differential)
  
  
 #Superflex.ppg.diff = Superflex.ppg.diff |>
    
  #  left_join(df_3, by = c("Name", "year"))
  
  
  Superflex.ppg.diff = top200 |>
    
    left_join(df_3, by = c("Name", "year"))
  
  
  ######
  
  
  
  Superflex.ppg.diff.filtered =  filter(Superflex.ppg.diff, !is.na(ppg_Differential))
  
  by_position <- group_by(Superflex.ppg.diff.filtered, Position)
  
  table = summarize(by_position, PointsPerGame.diff = median(ppg_Differential))
  
  message = "Positional Points Per Game Consistency"
  
  return(list(message, table))
  
}
  
  
  
  
  



