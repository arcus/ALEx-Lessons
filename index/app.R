
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  includeCSS("www/bootstrap.min.css"),
  includeCSS("www/style.css"),
  
    # Application title
    titlePanel(tags$h2("Welcome to the ARCUS Modular Education Support System")),"Many people at CHOP have become interested in R and statistical analysis in R.  For Arcus Education, creating a learning environment where 100% of attendees spend 100% of their time working towards their",tags$em("own"),"goals at their own pace is of utmost importance.",
    tags$br(),tags$br(),"Below you will find examples of how our system can provide this customized experience while being easily accessible anywhere in the world and maintaining reasonable throughput.",
    tags$h3("R Beginner"),
    "Here is an example lesson plan for a user who is just getting started with R. It covers the absolute basics including classes, logic, functions and graphics.",
    tags$br(),tags$br(),
    a("Example R Beginner Lesson Plan",href="../Personalized-Learning-Plan/?&modules=sHXtfjmhu84EQfHM7VpLV&curricula=qiJ&modulesplit=MTMsMA~~"),
    tags$h3("Introduction to Statistics in R"),
    "Here is an example lesson plan for a user with some familiarity with R but who wants to learn to perform statistical analysis. It covers some fundamentals as well as practical application of statistical tests in R.",
    tags$br(),tags$br(),
    a("Example Statistics Lesson Plan",href="../Personalized-Learning-Plan/?&modules=yoyXvAlV&curricula=qyR&modulesplit=NSww"),
    tags$h3("Example Lessons"),
    "Here are some additional example lessons",
    tags$br(),tags$br(),
    a("Basic Building Blocks",href="../swirl-basic-building-blocks/"),tags$br(),tags$br(),
    a("Variables",href="../variables/"),tags$br(),tags$br(),
    a("Correlation and Linear Regression",href="../sb-correlation-and-linear-regression/"),
    
    tags$h3("Generate a Customized Curriculum"),
    "Try your hand at generating a customized curriculum for yourself or others.",
    tags$br(),tags$br(),
    a("Custom Curriculum Generator",href="../Lesson-Generator/"),

)

# Define server logic required to draw a histogram
server <- function(input, output) {

}

# Run the application
shinyApp(ui = ui, server = server)
