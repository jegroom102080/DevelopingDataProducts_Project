library(shiny) 

BMI<-function(weight,height) {(weight*703)/(height^2)}

diagnostic_f<-function(weight,height){
  BMI_value<-weight*703/(height^2)
  ifelse(BMI_value<12, "Check inputs, if correct you are severely under weight", ifelse(BMI_value<18.5,"Under Weight",ifelse(BMI_value<25,"Normal",ifelse(BMI_value<30,"Over Weight",ifelse(BMI_value<60, "Obese", "Check inputs, if correct you are severely over weight")))))
}

shinyServer(
  function(input, output) {
    
    output$inputweightvalue <- renderPrint({input$weight})
    output$inputheightvalue <- renderPrint({input$height})
    output$estimation <- renderPrint({BMI(input$weight,input$height)})
    output$diagnostic <- renderPrint({diagnostic_f(input$weight,input$height)})
  } 
)