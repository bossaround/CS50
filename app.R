#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(networkD3)
load(url("https://github.com/bossaround/CS50/raw/master/CS50_node_edge_incl_dropout.RData"))

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("CS50 Sankey Diagram"),
  
  # sidebarLayout(
  #   sidebarPanel(
  #     sliderInput("opacity", "Opacity (not for Sankey)", 0.6, min = 0.1,
  #                 max = 1, step = .1)
  #   ),
    mainPanel(
      tabsetPanel(
        tabPanel("Including Dropout", sankeyNetworkOutput("sankey_drop")),
        tabPanel("Ignoring Dropout", sankeyNetworkOutput("sankey_no_drop"))
      )
    )
  # )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   output$sankey_drop <- renderSankeyNetwork({
     sankeyNetwork(
       Links = linkss2,
       Nodes = nodess2,
       Source = "source_ID",
       Target = "target_ID",
       Value = "Value",
       NodeID = "newname",
       fontSize = 12,
       nodeWidth = 30
     )
   })
   
   output$sankey_no_drop <- renderSankeyNetwork({
     sankeyNetwork(
       Links = linkss,
       Nodes = nodess,
       Source = "source_ID",
       Target = "target_ID",
       Value = "Value",
       NodeID = "newname",
       fontSize = 12,
       nodeWidth = 30
     )
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

