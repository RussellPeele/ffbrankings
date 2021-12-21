#Player consistency Plot

library(ggplot2)
library(dplyr)

load(file='Superflex_data_frame.Rda')


player_consistency=function(year_start, year_end, player_name)
  {

  
 
  player.projected = filter(Superflex.data, Name==player_name, actual=="no") %>%
    filter(year >= year_start) %>%
    filter(year <= year_end)
    
  
  player.actual = filter(Superflex.data, Name==player_name, actual=="yes")%>%
    filter(year >= year_start) %>%
    filter(year <= year_end)
  
  ggp <- ggplot(NULL, aes(x=year, y=Rank)) +    # Draw ggplot2 plot based on two data frames
    geom_line(data = player.projected, col = "red") +
    geom_line(data = player.actual, col = "blue")+
    coord_cartesian(ylim = c(-10, 500))
  
  message=paste("Projected Rank in Red - Actual Rank in Blue. From: ",
                year_start, "to", year_end, sep=" ")
  
   
  return(list(message, ggp))
  
  }
