library(shiny)

shinyUI(fluidPage(
    
    titlePanel("Coffee Brewing Methods"),
        
    sidebarLayout(
        sidebarPanel(
            radioButtons("units", "Units:",
                         c("Grams" = "grams",
                           "Ounces" = "ounces")),
            br(),
            
            sliderInput("n", 
                        "Number of servings:", 
                        value = 2,
                        min = 1, 
                        max = 4),
            #htmlOutput("sliderInputUI")
            
            tags$div(
                "Use the tabs to select your favorite brew method.
                Recipes will automatically adjust to your unit and serving size preferences."),
            br(),
            tags$div(
                "Recipes and ratios come from ",
                tags$a(href="http://tobysestate.com",target="_blank", "Toby's Estate"),
                " Brew Instructions pocket guidebook.")            
        
        ),
        
        # Show the tabs
        mainPanel(
            tabsetPanel(type = "tabs", 
                        tabPanel("Chemex", htmlOutput("chemex")),                         
                        tabPanel("French Press", htmlOutput("frenchpress")),
                        tabPanel("Moka Pot", htmlOutput("moka")),
                        tabPanel("Aeropress", htmlOutput("aeropress"))
            )
        )
    )
))