#
# The purpose of this application is exploratory data analysis regarding fantasy football consistency. 
# In gambling theory, the value of any bet is equal to its payoff x likelihood of that payoff occurring. 
# As such, a fantasy football manager must take into account consistency. How likely is it that a player
# will meet expectations? 
#

library(shiny)
library(shinythemes)
library(ggplot2)
library(dplyr)
library(tidyr)



shinythemes::themeSelector()
navbarPage(
    theme = shinytheme("united"),
    "Fantasy Football Projection Analysis",
    # First bar: Player Search
    tabPanel("Player Search",
             sidebarPanel(
                 sliderInput("yr_range_bar1", h3("Year Range:"),
                             min = 2014, max = 2020, value = c(2014,2020)),
             
                 selectizeInput("player_name_bar1", h3("Player"), choices=NULL, multiple=TRUE),
                 actionButton("action_bar1", "Update")
                 #submitButton("Update")
             ), #sidebar panel
             mainPanel(
                 textOutput("Message_bar1"),
                 plotOutput("Plot_2a")
             ) # mainpanel   
    ), #navbar1 tab panel
    
    tabPanel
    ("Analysis - Projected Rank vs Actual Rank",
             
        sidebarPanel(
            sliderInput("yr_range_bar2", h3("Year Range:"),
                    min = 2014, max = 2020, value = c(2014,2020)),
        
            numericInput("echelon_bar1", "Top _____ Players:", 100),
            actionButton("action_bar2", "Update")
        #submitButton("Update")
    ), #sidebar panel
    mainPanel(
        textOutput("Message_bar2"),
        tableOutput("rank.table")
    )# mainpanel   
    
    ), 
 #navbar1 tab panel
 
 tabPanel
 ("Analysis - Projected Points vs Actual Points",
     
     sidebarPanel(
         sliderInput("yr_range_bar3", h3("Year Range:"),
                     min = 2014, max = 2020, value = c(2014,2020)),
         
         numericInput("echelon_bar2", "Players Projected to score over ______ Fantasy Points:", 200),
         actionButton("action_bar3", "Update")
         #submitButton("Update")
     ), #sidebar panel
     mainPanel(
         textOutput("Message_bar3"),
         tableOutput("point.table")
     )# mainpanel   
     
 ), 
 
 tabPanel
 ("Analysis - Projected PPG vs Actual PPG",
     
     sidebarPanel(
         sliderInput("yr_range_bar4", h3("Year Range:"),
                     min = 2014, max = 2020, value = c(2014,2020)),
         
         numericInput("echelon_bar3", "Players Projected to score over ______ Fantasy Points Per Game", 10),
         actionButton("action_bar4", "Update")
         #submitButton("Update")
     ), #sidebar panel
     mainPanel(
         textOutput("Message_bar4"),
         tableOutput("ppg.table")
     )# mainpanel   
     
 ), 
    
    tabPanel("Regression Analysis", "Regression Analysis",
        selectizeInput("variable_bar1", h3("Position"), choices=NULL, multiple=TRUE),
        selectizeInput("variable_bar2", h3("Predictor"), choices=NULL, multiple=TRUE),
        actionButton("action_bar5", "Update")
    ),
    mainPanel(
        textOutput("Message_bar5"),
        verbatimTextOutput("Rsummary")
    )
        
        
    )
 
 
 


