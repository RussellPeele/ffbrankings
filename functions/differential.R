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
  
  
  Superflex.rank.diff = Superflex.data
  
  df_2 = top200 |>
    
    pivot_wider(!c(FantasyPointsPerGame, FantasyPoints),
                
                names_from = "actual",
                
                values_from = "Rank",
                
                values_fn = mean) |>
    
    mutate(Rank_Differential = abs(yes - no)) |>
    
    filter(!is.na(Rank_Differential)) |>
    
    select(Name, year, Rank_Differential)
  
  
  Superflex.rank.diff = Superflex.rank.diff |>
    
    left_join(df_2, by = c("Name", "year"))
  
  
  Superflex.rank.diff = top200 |>
    
    left_join(df_2, by = c("Name", "year"))
  
  
  ######
  
  
  
  Superflex.rank.diff.filtered =  filter(Superflex.rank.diff, !is.na(Rank_Differential))
  
  by_position <- group_by(Superflex.rank.diff.filtered, Position)
  
  table = summarize(by_position, rank.diff = mean(Rank_Differential))
  
  message = "Positional Rank Consistency"
  
  return(list(message, table))
  
}


