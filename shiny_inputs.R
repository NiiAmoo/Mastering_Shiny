library(shiny)

animals <- c("dog", "cat", "mouse", "bird", "other", "I hate animals")


ui <- fluidPage(
  h4('Free text inputs'),
  
  textInput("name", "What's your name?"), # Short text input
  passwordInput("password","Enter your password"),
  textAreaInput("story","Tell me about yourself",rows = 3), # long text input
  
  br(),
  
  h4('Numeric inputs'),
  
  numericInput("num", "Number one", value = 0, min = 0, max = 100),
  sliderInput("num2", "Number two", value = 50, min = 0, max = 100,step = 5), 
  sliderInput("dateslider", "When should we deliver?", value = as.Date('2022-07-01') , min = as.Date('2022-01-01'), max = as.Date('2022-12-01')), 
  sliderInput("rng", "Range", value = c(10, 20), min = 0, max = 100), # range slider
  
  br(),
  
  h4('Date inputs'),
  
  dateInput("dob", "When were you born?"),
  dateRangeInput("holiday", "When do you want to go on vacation next?"),
  
  br(),
  
  h4('Limited input choices'),
  selectInput("state", "What's your favourite state?", state.name),
  selectInput("state", "Choose a state:",
              list(`East Coast` = list("NY", "NJ", "CT"),
                   `West Coast` = list("WA", "OR", "CA"),
                   `Midwest` = list("MN", "WI", "IA"))
  ), # grouped list
  radioButtons("animal", "What's your favourite animal?", animals),
  radioButtons("rb", "Choose one:",
               choiceNames = list(
                 icon("angry"),
                 icon("smile"),
                 icon("sad-tear")
               ),
               choiceValues = list("angry", "happy", "sad")),
  selectInput(
                 "state", "What's your favourite state?", state.name,
                 multiple = TRUE
               ),
  checkboxInput("cleanup", "Clean up?", value = TRUE), # single selection (True/False)
  checkboxInput("shutdown", "Shutdown?"),
  checkboxGroupInput("animal", "What animals do you like?", animals), # multiple selection
  
  
  br(),
  
  h4('File uploads'),
  
  fileInput("upload", NULL),
  
  
  br(),
  
  h4('Action buttons'),
  # Let the user perform an action with actionButton() or actionLink():
  actionButton("click", "Click me!"),
  actionButton("drink", "Drink me!", icon = icon("cocktail")),
  
  br(),
  
  fluidRow(
    actionButton("click", "Click me!", class = "btn-info"),
    actionButton("drink", "Drink me!", class = "btn-lg btn-success")
  ),
  fluidRow(
    actionButton("eat", "Eat me!", class = "btn-block")
  )
  
  
  
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)