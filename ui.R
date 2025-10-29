# ui.R
library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("MPG Predictor for 'mtcars' Dataset"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    
    # Sidebar for user inputs and documentation
    sidebarPanel(
      # Input: Slider for horsepower
      sliderInput("hp_input",
                  "Select Horsepower (hp):",
                  min = 50,
                  max = 350,
                  value = 150),
      
      hr(), # Adds a horizontal line
      
      # --- Documentation Section ---
      h3("App Documentation"),
      p("This simple application predicts the Miles Per Gallon (MPG) 
              of a car based on its gross horsepower (hp)."),
      h4("How to Use:"),
      p("1. Move the 'Select Horsepower (hp)' slider above."),
      p("2. The app uses a pre-built linear regression model based on 
              the 'mtcars' dataset."),
      p("3. The main panel on the right will instantly update to show 
              the predicted MPG for a car with that horsepower.")
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      h3("Prediction Result"),
      p("Based on the model, a car with the horsepower you selected:"),
      h4(textOutput("hp_output")),
      p("...is predicted to get:"),
      h4(textOutput("mpg_prediction"))
    )
  )
))