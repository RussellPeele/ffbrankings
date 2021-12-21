


source("global.R")

load(file='Superflex_data_frame.Rda')


server = function(input, output, session) {
    
    
    # First Bar
    dataInput_bar1<- eventReactive(input$action_bar1,
    {
        source("functions/player_consistency.R")
        player_consistency(input$yr_range_bar1[1], input$yr_range_bar1[2], input$player_name_bar1)
    }
    )
    
    output$Message_bar1<- renderText({
        paste(dataInput_bar1()[[1]])
    })
    
    output$Plot_2a <- renderPlot({
        dataInput_bar1()[[2]]
    })
    
    # Bar 2
    dataInput_bar2<- eventReactive(input$action_bar2,
    {
        source("functions/rank_differential.R")
        rank_differential(input$yr_range_bar2[1], input$yr_range_bar2[2], input$echelon_bar1)
    }
    )
    
    output$Message_bar2<- renderText({
        paste(dataInput_bar2()[[1]])
    })
    
    output$rank.table <- renderTable({
        dataInput_bar2()[[2]]
    })
    
    
    
    
    
    #Bar 3 PPG Analysis
    
    dataInput_bar2<- eventReactive(input$action_bar2,
    {
                source("functions/rank_differential.R")
                rank_differential(input$yr_range_bar2[1], input$yr_range_bar2[2], input$echelon_bar1)
    }
    )
    
    output$Message_bar2<- renderText({
        (dataInput_bar2()[[1]])
    })
    
    output$table <- renderTable({
        dataInput_bar2()[[2]]
    })
    
    
    #Bar 4 PPS Analysis 
    dataInput_bar2<- eventReactive(input$action_bar2,
                                   {
                                       source("functions/rank_differential.R")
                                       rank_differential(input$yr_range_bar2[1], input$yr_range_bar2[2], input$echelon_bar1)
                                   }
    )
    
    output$Message_bar2<- renderText({
        paste(dataInput_bar2()[[1]])
    })
        
    output$rank.table <- renderTable({
        dataInput_bar2()[[2]]
    })
    
    
}