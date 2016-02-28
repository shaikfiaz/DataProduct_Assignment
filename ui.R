# Define UI for slider demo application
shinyUI<-fluidPage(
        #  Application title
        titlePanel("Decision Tree on Iris Data Set"),
        # Sidebar with sliders that demonstrate various available
        # options
        sidebarLayout(
                sidebarPanel(
                        sliderInput("Sepal.Length", "Sepal.Length:", 
                                    min=0, max=10, value=5,step = 0.5),
                        
                        # Decimal interval with step value
                        sliderInput("Sepal.Width", "Sepal.Width:", 
                                    min = 0, max = 10, value = 3, step= 0.2),
                        
                        # Specification of range within an interval
                        sliderInput("Petal.Length", "Petal.Length:",
                                    min = 0, max = 10, value = 4, step= 0.5),
                        
                        sliderInput("Petal.Width", "Petal.Width:",
                                    min = 0, max = 10, value = 1, step= 0.2)
                        
                        
                ),
                
                # Show a table summarizing the values entered
                mainPanel(
                        verbatimTextOutput("Result"),
                        plotOutput("plot")
                )
        )
)
