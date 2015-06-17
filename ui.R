library(shiny)
library(e1071)

shinyUI(fluidPage(theme = "bootstrap.css",
    titlePanel(h1("Predict the Species")),
    headerPanel(h4("This app will predict the species of a flower based on its 
                    sepal length and width and petal length and width
                   in centimeters. This is done based on a prediction algorithm 
                    trained on the IRIS dataset,with linear discriminant analysis 
                    method and train function from the caret package. The iris dataset
                    has flowers from only 3 species : Iris setosa, versicolor, and virginica. 
                    Consequently, any new flower will be fit into one for the three species. 
                    ")),
sidebarLayout(
    sidebarPanel(width = 6,
        h4("Please enter the measurements below and click Predict button to check what species it belongs to. Some sample measurements
                have been provided for testing"),
        
        h5("For example"),
        h5("5.1 3.5 1.4 0.2	setosa ; 4.9 3.0 1.4	0.2	setosa"),
        h5("6.1 3.0	4.9	1.8	virginica;   6.4 2.8	5.6	2.1	virginica"),
         h5("5.6 3.0 4.1 1.3 versicolor; 5.5 2.5 4.0 1.3 versicolor"),
        numericInput('Sepal.Length',"Sepal Length",5.1),
        numericInput('Sepal.Width',"Sepal Width",3.5),
        numericInput('Petal.Length',"Petal Length",1.4),
        numericInput('Petal.Width',"Petal Width",0.2),
        actionButton('act',"Predict Species")        
    ),
    
    mainPanel(width=4, h3('The flower belongs to species'),verbatimTextOutput("text"))
    )))