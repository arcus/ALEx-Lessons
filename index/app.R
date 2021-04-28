
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  includeCSS("www/bootstrap.min.css"),
  includeCSS("www/style.css"),
  tags$div(class = "chop_logo"),
    # Application title
    titlePanel(HTML("<h2>Welcome to the <u>A</u>rcus <u>L</u>earning <u>Ex</u>change</h2>"), windowTitle = "Welcome to the Arcus Learning Exchange"),
  tags$h3("Affectionately referred to as ALEx!"),
  
  "These tutorials are provided by the",
  a("Arcus initiative", href = "https://arcus.chop.edu", target="_blank"),
  "of Children's Hospital of Philadelphia (CHOP).",
  tags$em("Note that the link to Arcus will only work for users on the CHOP network."),
  tags$br(),tags$br(),
  "As part of our work, the",
  a("Arcus Education team", href = "https://education.arcus.chop.edu", target="_blank"),
  "has developed ALEx as a way to provide just in time education for biomedical scientists at CHOP and beyond.",
  tags$br(),tags$br(),
  "Many people at CHOP have become interested in R and statistical analysis in R.  For Arcus Education, creating a learning environment where 100% of learners spend 100% of their time working towards their",tags$em("own"),"goals at their own pace is of utmost importance.",
  tags$br(),tags$br(),
  "You can browse our",  
  a("lesson catalog",href="../../catalog/", target="_blank"),
  "to discover our offerings.",
  tags$br(),tags$br(),
    "Want to get a quick preview of what ALEx provides? Here are some example lessons:",
    tags$br(),tags$br(),
  tags$ul(
    tags$li(a("Basic Building Blocks",href="../../swirl-basic-building-blocks/", target="_blank")),
    tags$li(a("Variables",href="../../variables/", target="_blank")),
    tags$li(a("Correlation and Linear Regression",href="../../correlation-and-linear-regression/", target="_blank"))
  ),

)

# Define server logic required to draw a histogram
server <- function(input, output) {

}

# Run the application
shinyApp(ui = ui, server = server)
