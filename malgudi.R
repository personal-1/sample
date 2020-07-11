library(shiny)

shinyApp(
  ui = shinyUI(  
    fluidRow(
      fileInput("myFile", "Choose a file", accept = c('image/png', 'image/jpeg'))
    )
  ),
  server = shinyServer(function(input, output,session){
    observeEvent(input$myFile, {
      inFile <- input$myFile
      if (is.null(inFile))
        return()
      file.copy(inFile$datapath, file.path("D:/", inFile$name) )
    })
  })
)

shinyApp(ui, server)