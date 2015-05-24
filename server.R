library(shiny)

# Define server logic for random distribution application
shinyServer(function(input, output) {
        
    # react to unit changes
    # returns a multiplier
    unitconversion <- reactive({
        switch(input$units,
                "grams" = 1,
                "ounces" = 0.035274)        
    })
    
    # returns "g" or "oz" depending on the units
    getunits <- reactive({
        switch(input$units,
               "grams" = "g",
               "ounces" = "oz")        
    })
    
    # Helper function to build the header for each tab
    buildStr <- function(ratio,coffee,water,units,grind) {
        x <- paste("Ratio 1:",ratio,sep="")
        x <- paste(x,"<br/>",coffee,units," coffee",sep="")
        x <- paste(x,"<br/>",water,units," water",sep="")
        x <- paste(x,"<br/><i>",grind," grind</i>",sep="")
        x <- paste(x,"<hr/>")        
    }
    
    # Generate the string for the Chemex tab
    output$chemex <- renderText({
        multiServing <- TRUE
        ratio <- 14    
        coffee <- round(25 * input$n * unitconversion())
        water <- round(coffee * ratio)
        units <- getunits()                
        
        bloom_water <- round(50 * input$n * unitconversion())
        remaining_water <- water - bloom_water
        
        hdr <- buildStr(ratio,coffee,water,units,"medium-coarse")
        steps <- "<ol>
            <li>Fold filter with threefold toward the spout
            <li>Pre-wet filter and discard water
            <li>Add medium-coarse ground coffee
            <li>Begin timer        
            <li>Slowly pour " 
        steps <- paste(steps,bloom_water,units,sep="")
        steps <- paste(steps," hot water in small circular motions
            <li>Let bloom for 45 seconds
            <li>Slowly pour ", sep="") 
        steps <- paste(steps,remaining_water,units,sep="")
        steps <- paste(steps," water in small circular motions            
            <li>Target brew time: 4:00
            </ol>",sep="")
        paste(hdr,steps)
    })
    
    # Generate the string for the French Press tab
    output$frenchpress <- renderText({
        multiServing <- TRUE
        #"Ratio 1:15"
        ratio <- 15    
        coffee <- round(25 * input$n * unitconversion())
        water <- round(coffee * ratio)
        units <- getunits()
        
        bloom_water <- round(75 * input$n * unitconversion())
        remaining_water <- water - bloom_water
        
        hdr <- buildStr(ratio,coffee,water,units,"coarse")
        steps <- "<ol>
            <li>Add coarse ground coffee            
            <li>Begin timer
            <li>Slowly pour "
        steps <- paste(steps,bloom_water,units,sep="")
        steps <- paste(steps," hot water
            <li>Let bloom for 45 seconds
            <li>Slowly pour ",sep="")
        steps <- paste(steps,remaining_water,units,sep="")
        steps <- paste(steps," hot water
            <li>Gently stir
            <li>Press at 4:00
            </ol>",sep="")
        paste(hdr,steps)
    })
    
    # Generate the string for the Moka Pot tab
    output$moka <- renderText({ 
        multiServing <- FALSE
        ratio <- 12
        coffee <- round(20 * input$n * unitconversion())
        water <- round(coffee * ratio)
        units <- getunits()
        hdr <- buildStr(ratio,coffee,water,units,"medium-fine")
        steps <- "<ol>
            <li>Add "
        steps <- paste(steps,water,units,sep="")
        steps <- paste(steps," boiling water to bottom pot chamber
            <li>Place filter basket in base
            <li>Add ",sep="")
        steps <- paste(steps,coffee,units,sep="")
        steps <- paste(steps," medium-fine ground coffee
            <li>Level coffee and re-assemble pot securely
            <li>Place on burner on medium heat            
            <li>Once the percolating sounds stop, remove from heat and rest for 30 seconds
            </ol>",sep="")
        paste(hdr,steps)
    })
    
    # Generate the string for the Aeropress tab
    output$aeropress <- renderText({        
        multiServing <- FALSE
        ratio <- 14    
        coffee <- round(17 * input$n * unitconversion())
        water <- round(coffee * ratio)
        units <- getunits()
        
        bloom_water <- round(45 * input$n * unitconversion())
        remaining_water <- water - bloom_water
        
        hdr <- buildStr(ratio,coffee,water,units,"medium")
        steps <- "<ol>
            <li>Insert filter into cap and pre-wet
            <li>Invert Aeropress
            <li>Begin timer
            <li>Pour "
        steps <- paste(steps,bloom_water,units,sep="")
        steps <- paste(steps," hot water
            <li>Stir and let bloom for 45 seconds
            <li>Slowly pour ",sep="")
        steps <- paste(steps,remaining_water,units,sep="")
        steps <- paste(steps," water in small circular motions
            <li>At 3:00, flip Aeropress onto vessel and gently press down
            </ol>",sep="")
        paste(hdr,steps)        
    })
        
})