library(shiny)

treeHeight <- function(iage, iseed) subset(Loblolly, Seed == iseed & age == iage, select = height)

shinyServer(
        function(input,output) {
                output$oiage <- renderPrint({input$iage})
                output$oiseed <- renderPrint({input$iseed})
                output$theight <- renderPrint({treeHeight(input$iage, input$iseed)})
                output$text1 <- renderText({
                        if (input$gheight == round(treeHeight(input$iage, input$iseed))) "you have got it right"
                        else "you have got it wrong"
                        
                })
                
                output$main_plot <- renderPlot({
                        
                        plot(height ~ age, data = Loblolly, main = paste("seed =",input$iseed),subset = Seed == input$iseed)}, height = 400, width = 500 )
                
        }
)

