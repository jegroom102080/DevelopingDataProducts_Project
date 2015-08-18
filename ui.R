library(shiny) 
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Body Mass Index (BMI) Calculator"),
    
    sidebarPanel(
      numericInput('weight', 'Your weight in pounds', 0) ,
      numericInput('height', 'Yourheight in inches', 0, min = 0, max = 96, step = 0.01),
      submitButton('Submit')
    ), 
    mainPanel(
      p('The Body mass index (BMI) is a calculation of body fat using a person\'s height and weight and only applies to adults.'),
      p('Regarding the BMI measure, the World Health Organization (WHO) proposes the following classification:'),
      tags$div(
        tags$ul(
          tags$li('BMI <18.5       : Under Weight'),
          tags$li('BMI [18.5-24.9] : Normal weight'),
          tags$li('BMI [25-29.9]   : Over Weight'),
          tags$li('BMI >=30        : Obese')
        )
      ),
      
      h4('Taking into account the values you specified:'), 
      
      h4('Your BMI is:'),
      verbatimTextOutput("estimation"),
      p('That means that you are:'),strong(verbatimTextOutput("diagnostic"))
      
      
    )
    
  )   
)