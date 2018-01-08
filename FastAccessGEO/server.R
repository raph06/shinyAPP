library(GEOquery)
library(DT)
source('functions.R')
function(input, output) {

  gs=reactive({output_labels=paste('../',input$gse,'/',input$gse,'_',input$gpl,'_patient_label.txt',sep="")
  output_expr=paste('../',input$gse,'/',input$gse,'_',input$gpl,'_exprs.txt',sep="")
  list(output_labels,output_expr)
  })
  
  gse<-reactive({
    
    withProgress(message = 'Importing GSE', value = .5, {
      # Number of times we'll go through the loop
      n <- 2
      
      while (n < 3) {
        # Each time through the loop, add another row of data. This is
        # a stand-in for a long-running computation.
        if (n==2)
          {gset=get_info(input$gse)
        }
        # Increment the progress bar, and update the detail text.
        incProgress(1/n, detail = "importing gse")
        n=n+1
        # Pause for 0.1 seconds to simulate a long computation.
        Sys.sleep(0.1)}})
    gset
    })
  
  output$view <- DT::renderDataTable(
    DT::datatable(gse(), options = list(pageLength = 5),selection=list(method='multiple', target ='column')))

  parse<-reactive({
    platf=parseGPL(paste("../",input$gse,"/platf/",input$gpl,".annot",sep=""))
  ncbifd <- data.frame(attr(dataTable(platf), "table"))
  probe_and_genes=ncbifd[,c(1,3)]
  ncbifd
  })
  
  output$caption <- renderText({
    gs()
  })
  
  
  output$view2= DT::renderDataTable(
    DT::datatable(parse(), options = list(pageLength = 5),selection=list(method='multiple', target ='column'))
   )
  

}

# origTable_selected <- reactive({
#   ids <- input$origTable_rows_selected
#   mtcars[ids,]
# })
# 
# output$origTableSelected <- DT::renderDataTable({
#   datatable(
#     origTable_selected(),
#     selection = list(mode = "multiple"),
#     caption = "Selected Rows from Original Data Table"
#   )
# })
#   


