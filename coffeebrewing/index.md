---
title       : Coffee Brewing Methods
subtitle    : Adjustable Recipes for Chemex, French Press, Moka Pot, and Aeropress
author      : 
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Motivation

Think about the last cup of coffee you enjoyed. Did it come from a fancy coffee shop with unusual brewing equipment? Now you can make a great cup, too!

This app takes the mystique out of quality brewing. You select your prefered method and the number of cups you want to make, and it will adjust a specific recipe to meet your needs. 

Equipment to have on hand: brew vessel, coffee, water and kettle, and a scale with units in grams or ounces.

---

## Coffee Brewing Basics

We cover four brewing methods: Chemex, French Press, Moka Pot, and Aeropress.

First you need to decide which method is right for you. Chemex and French Press are better at scaling, though their flavor profiles are rather distinct. A Moka Pot is very simple, and an Aeropress produces a great double espresso (which you can turn into an Americano by topping off with hot water).
Once you've chosen your brew method, you'll need your favorite coffee beans ground to the proper fineness. Consider standard drip coffee as a familiar reference. This is a medium grind. The Chemex and French Press will work better with a slightly coarser grind; the Aeropress and Moka Pot will work better with a slightly finer grind.

Now you just need to decide how much coffee you want to drink!

---

## Scaling and Unit Conversions
The app starts with a basic ratio of coffee to water for each brew method. It scales these values based on the user's input, and will adjust the units between grams and ounces to meet the user's preference.

Here we show calculated values for two-cup Chemex and French Press and one-cup Moka Pot and Aeropress.

```r
method <- c("Chemex","French Press","Moka Pot","Aeropress")
coffee_g <- c(50,50,20,17); ratio <- c(14,15,12,14); water_g <- coffee * ratio
coffee_oz <- round(coffee * 0.035274); water_oz <- round(water_g * 0.035274)
data.frame(method,ratio,coffee_g,water_g,coffee_ounces,water_ounces)
```

```
##         method ratio coffee_g water_g coffee_ounces water_ounces
## 1       Chemex    14       50     700             2           25
## 2 French Press    15       50     750             2           26
## 3     Moka Pot    12       20     240             1            8
## 4    Aeropress    14       17     238             1            8
```

---

## Final Product
Check out [Coffee Brewing Methods](https://jrcarli.shinyapps.io/dataproducts/) on [shinyapps.io](http://www.shinyapps.io)!

The recipes and ratios used in this app came from the [Toby's Estate](http://tobysestate.com) Brew Instructions pocket guidebook.

