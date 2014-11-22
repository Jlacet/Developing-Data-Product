library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Pinus Taeda (Loblolly Pine)"),
        sidebarPanel(
                numericInput('iage', 'Age of the tree', 10, min=5, max =25, step=5),
                numericInput('iseed', 'seed number', 307, min=301, max =315, step=2),
                sliderInput('gheight', 'Guess the height', value = 50, min = 1, max = 100, step = 1,),
                submitButton('Submit')
                
        ),
        mainPanel(
                h3('Determine the height of the tree'),
                h4('Requested age (yr.)'),
                verbatimTextOutput("oiage"),
                h4('Requested seed number'),
                verbatimTextOutput("oiseed"),
                h4('Which resulted in the height (ft.) of the tree of '),
                verbatimTextOutput("theight"),
                p('Your Guess:'),
                textOutput('text1'),
                plotOutput(outputId = "main_plot", width = "100%")
        )
))

