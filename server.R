# server.R
library(shiny)

# Load the mtcars dataset
data(mtcars)

# Build the linear regression model only once
# We predict mpg (Miles Per Gallon) using hp (Gross horsepower)
model <- lm(mpg ~ hp, data = mtcars)

# Define server logic
shinyServer(function(input, output) {
  
  # --- Server Calculations ---
  
  # Create a reactive expression for the prediction
  # This recalculates automatically when 'hp_input' changes
  prediction <- reactive({
    hp_selected <- input$hp_input
    # Create a new dataframe for the prediction input
    new_data <- data.frame(hp = hp_selected)
    # Predict the MPG
    predict(model, newdata = new_data)
  })
  
  # --- Outputs Displayed in UI ---
  
  # Output: Display the selected horsepower
  output$hp_output <- renderText({
    paste(input$hp_input, "hp")
  })
  
  # Output: Display the calculated MPG prediction
  output$mpg_prediction <- renderText({
    # We access the reactive prediction by calling it like a function: prediction()
    pred_val <- prediction()
    paste(round(pred_val, 1), "MPG")
  })
  
})