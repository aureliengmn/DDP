#FICHIER ui.R

library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel=headerPanel("Olive Table from Pgmm package"),
  
  sidebarPanel(
    
    p("We are using the Olive Data set available on the Pgmm Package"),
    
    p("It gives differents olive's caracteristics splitted on nine Areas. You can select wich Areas and variable you want to plot and get the mean."),
    
    selectizeInput('Area_sel', 'Area to displays', 
                   choices = list(
                     Region1 = c(`Area1` = 1, `Area2` = 2, `Area3` = 3, `Area4` = 4),
                     Region2 = c(`Area5` = 5, `Area6` = 6),
                     Region3 = c(`Area7` = 7, `Area8` = 8, `Area9` = 9)
                   ), multiple = TRUE, selected =  c(1,2,9)),
    
    br(),
    
    selectInput("Variable1", 
                "First variable selection :",
                choices = c(`Palmitic` = "Palmitic" , `Palmitoleic` = "Palmitoleic", `Oleic` = "Oleic", `Stearic` = "Stearic", `Linoleic` = "Linoleic", `Linolenic` = "Linolenic", `Arachidic` = "Arachidic"),
                selected = "Palmitic"
    ),
    
    
    br(),
    
    selectInput("Variable2", 
                "Second variable selection :",
                choices = c(`Palmitic` = "Palmitic" , `Palmitoleic` = "Palmitoleic", `Oleic` = "Oleic", `Stearic` = "Stearic", `Linoleic` = "Linoleic", `Linolenic` = "Linolenic", `Arachidic` = "Arachidic"),
                selected ="Oleic"
    )
  ),
  
  mainPanel(
    h3('Variable description by Area'),
    
    br(),
    
    h4('Plot of the two variables selected, colored by Area'),
    plotOutput("plot"),
    
    br(),
    
    h4('Here is the mean of each variable on each selected Area :'),
    verbatimTextOutput("mean")
    
  )
)
)