
bootstrapPage(
  navbarPage(
    title = 'Data',
    
          tabPanel('Set inputs',textInput("gse", "Enter valid GSE identifier:",
                                        value = "GSE48558"),
             textInput("gpl", "Enter corresponding platform identifier:",
                       value = "GPL6244"),
             'You must download gplXXX.annot to access the data'
             ),
             
    
    
    
            tabPanel('Display GPL',
                     DT::dataTableOutput('view2')
                     ),
  
          
           
            tabPanel('Display GSE',  DT::dataTableOutput('view')
                     )
            
    #DT::dataTableOutput("view2")
    
  ))
      

  
  
  # checkboxInput(inputId = "individual_obs",
  #               label = strong("Show individual observations"),
  #               value = FALSE),
  # 
  # checkboxInput(inputId = "density",
  #               label = strong("Show density estimate"),
  #               value = FALSE),
  
  
  # # Display this only if the density is shown
  # conditionalPanel(condition = "input.density == true",
  #                  sliderInput(inputId = "bw_adjust",
  #                              label = "Bandwidth adjustment:",
  #                              min = 0.2, max = 2, value = 1, step = 0.2)
  # )
  
#)

