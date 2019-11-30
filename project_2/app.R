library(shiny)
library(tidyverse)
library(ggplot2)
library(hexbin)
library(rsconnect)
source("project2_helper.R")

dat = clean_dat()

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Trend of the Amount of Food (lbs) Distributed by UMD over Time"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        # Input the period range of data you want to explore
        sliderInput(inputId = "timePeriod",
                    label = "Choose time period that you would like to observe the trend of the amount of food provided",
                    min = 1983,
                    max = 2019,
                    value = c(1983, 2000))
      ),
      mainPanel(
        plotOutput(outputId = "TrendPlot")
      )
   )
)

# Define server logic required to draw a histogram
server = function(input, output){
  output$TrendPlot = renderPlot({plot_trend(input$timePeriod, dat)})
  output$text1 <- renderText("Select the time period to visualize the trend of the amount of food provided by UMD")
}


# Run the application 
shinyApp(ui = ui, server = server)

