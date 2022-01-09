


source("global.R")

load(file='superflex_data_frame.Rda')
load(file='superflexcomplete_data_frame.Rda')


server = function(input, output, session) {
    
    
    # Bar 1
    observe({
        names = unique(Superflex.complete$Name)
        updateSelectizeInput(session, "player_name_bar1", choices=names, server=TRUE)})
    
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
    
    dataInput_bar3<- eventReactive(input$action_bar3,
    {
                source("functions/rank_differential.R")
                point_differential(input$yr_range_bar3[1], input$yr_range_bar3[2], input$echelon_bar2)
    }
    )
    
    output$Message_bar3<- renderText({
        (dataInput_bar3()[[1]])
    })
    
    output$point.table <- renderTable({
        dataInput_bar3()[[2]]
    })
    
    
    #Bar 4 PPG Analysis 
    dataInput_bar4<- eventReactive(input$action_bar4,
        {
            source("functions/rank_differential.R")
            ppg_differential(input$yr_range_bar4[1], input$yr_range_bar4[2], input$echelon_bar3)
        }
    )
    
    output$Message_bar4<- renderText({
        paste(dataInput_bar4()[[1]])
    })
        
    output$ppg.table <- renderTable({
        dataInput_bar4()[[2]]
    })
    
    
   # Bar 5 - Regression Analysis
    observe({
        positions = unique(Superflex.complete$Position)
        updateSelectizeInput(session, "variable_bar1", choices=positions, server=TRUE)
        updateSelectizeInput(session, "variable_bar2", choices=colnames(Superflex.complete), server=TRUE)
    })
    
    dataInput_bar5<- eventReactive(input$action_bar5,
                                   {
                                       source("functions/linear_predictions.R")
                                       linear_prediction(input$variable_bar1, input$variable_bar2)
                                   }
    )
    
    output$Message_bar5<- renderText({
        paste(dataInput_bar5()[[1]])
    })
    
    output$Rsummary <- renderPrint({
        dataInput_bar5()[[2]]
    })
}