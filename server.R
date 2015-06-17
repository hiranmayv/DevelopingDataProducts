library(shiny)
library(caret)
library(e1071)
data(iris)
# create training and test sets
inTrain <- createDataPartition(y=iris$Species,p=0.7, list=FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]
# run the linear discriminant analysis on training data
lda <- train(Species ~ .,data=training,method="lda")
#newdata <- data.frame(Sepal.Length=5.1, Sepal.Width=3.5,Petal.Length=1.4,Petal.Width=0.2)


shinyServer(function(input,output){    
   output$text <- renderText({
                    input$act
                     isolate({
                       
                        
                        newdata <- data.frame(
                            Sepal.Width = input$Sepal.Width,
                            Sepal.Length = input$Sepal.Length,
                            Petal.Length = input$Petal.Length,
                            Petal.Width = input$Petal.Width)
                        
                    })                    
                    pred =  predict(lda,newdata)
                     return(levels(iris$Species)[pred])})
                   
})