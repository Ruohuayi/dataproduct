library(shiny)
##The idea is to create two plots with different factors, weight and horsepower, related to miles per gallon 
##of a car. The user can input values by sliding two slides and get predictions from plots, which showed 
##on two tabs. 

##Slides are on sidebar panel.
shinyUI(fluidPage(
  titlePanel("Which factors has a better influence on MPG, weight or amount of cylinders"),
  sidebarLayout(
    sidebarPanel(
       sliderInput("weight", "Weight of a car:", min = 1, max = 6, step=0.01, value = 3),
       sliderInput("hp", "Horsepower:", min = 50, max = 340, step=1, value=100)
    ),
##Two tabs are on the main panel.       
    mainPanel(
      tabsetPanel(
        tabPanel("Weight", br(),
      h3("Relationship between weight and MPG"), 
      plotOutput("plotWt"),
      h3("Predicted MPG from Model 1:"),
      textOutput("pred1")
    ),
        tabPanel("Horsepower", br(),
      h3("Relationship between horsepower and MPG"),
      plotOutput("plotHp"),
      h3("Predicted MPG from Model 2:"),
      textOutput("pred2")
      ))
  )
))
)