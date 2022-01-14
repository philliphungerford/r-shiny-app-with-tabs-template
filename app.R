##############################################################################
# Purpose: Dashboard Template
# Author: Phillip Hungerford
# Date: 2021-01-14
##############################################################################
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
# 
# Dashboard help: 
# https://rstudio.github.io/shinydashboard/structure.html
#
# Adding text to your shiny app
# https://shiny.rstudio.com/tutorial/written-tutorial/lesson2/
#
# Icons:
# https://fontawesome.com/v4.7.0/icons/
##############################################################################
# Import libraries
library(shiny) # for dashboard
library(shinydashboard) # for tabs
library(dplyr) # filtering
library(RColorBrewer)
#library(haven)
#library(DT) # for displaying tables
library(ggplot2) # for figures
#library(data.table)
#library(reshape2) # for data manipulation
library(tools)
library(tidyverse) # adds to title case
library(scales) # add comma to output
##############################################################################
# SETTINGS
github_link <- 'https://github.com/philliphungerford/covid-tracker-au-nsw'
website_link <- 'https://philliphungerford.com'

# Tab Names
TabNames <- c(
  "Tab1",
  "Tab2",
  "Tab3",
  "Tab4"
)

# Sample
datasets <- c("economics", "faithfuld", "seals")

##############################################################################
# TAB 1: USER INTERFACE
##############################################################################
# Define UI for application that draws a histogram
ui <- dashboardPage(
  #=========================================================================
  # START DASHBOARD
  #=========================================================================
  # MAIN TITLE
  dashboardHeader(title =  "Dashboard with Tabs Sample",
                  titleWidth = 300,
                  tags$li(class="dropdown",
                          tags$a(href=github_link, icon('github'), "Source Code", target="_blank")),
                  tags$li(class="dropdown",
                          tags$a(href=website_link, icon('globe'), "Learn More", target="_blank"))
  ),
  #=========================================================================
  ## Sidebar content
  dashboardSidebar(
    sidebarMenu(
      # icons from (https://fontawesome.com/v4.7.0/icons/)
      menuItem(TabNames[1], tabName = TabNames[1], icon = icon("desktop")),#
      menuItem(TabNames[2], tabName = TabNames[2], icon = icon("chart-bar")),#
      menuItem(TabNames[3], tabName = TabNames[3], icon = icon("medkit")),#
      menuItem(TabNames[4], tabName = TabNames[4], icon = icon("info"))#
    )
  ),
  #=========================================================================
  ## Body content
  dashboardBody(
    tabItems(
      
      #-----------------------------------------------------------------
      # TAB 1: Overview
      tabItem(tabName = TabNames[1],
              #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              ## Row 1 - First 4 boxes
              h1("Header 1"),
              h2("Header 2"),
              p("Paragraph text."),
              
              # Row 1
              h1("Row 1 with Boxes"),
              
              fluidRow(
                
                # First box in row 1
                column(width=6,
                       valueBox(
                         value =  "Row 1 Box 1",
                         "Date updated",
                         icon = icon("calendar"),
                         color = 'blue',
                         width = NULL)),
                
                # Second box in row 1
                column(width=6,
                       valueBox(
                         value =  "Row 1 Box 2",
                         "Date updated",
                         icon = icon("calendar"),
                         color = 'blue',
                         width = NULL)),
              ),
              
              # Row 2
              h1("Row 2 with Boxes"),
              
              fluidRow(
                
                # First box in row 1
                column(width=6,
                       valueBox(
                         value =  "Row 2 Box 1",
                         "Date updated",
                         icon = icon("calendar"),
                         color = 'blue',
                         width = NULL)),
                
                # Second box in row 1
                column(width=6,
                       valueBox(
                         value =  "Row 2 Box 2",
                         "Date updated",
                         icon = icon("calendar"),
                         color = 'blue',
                         width = NULL)),
              ),
              
              # Row 3
              h1("Row 3 with Plot"),
              
              fluidRow(
                
                column(width=3,
                       
                       sliderInput(inputId = "bins",
                                   label = "Number of bins:",
                                   min = 1,
                                   max = 50,
                                   value = 30)),
                
                column(width=9,
                       plotOutput(outputId = "distPlot", width = NULL, height = 600)
                       )),
                      
      ),
      
      #-----------------------------------------------------------------
      # TAB 2: Breakdown
      tabItem(tabName = TabNames[2],
              
              #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              ## Row 1 - First 4 boxes
              h1("Tab 2")
      ),
      #-----------------------------------------------------------------
      # TAB 3: Vaccinations
      tabItem(tabName = TabNames[3],
              #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              ## Row 1 - First 4 boxes
              h1("Tab 3")
      ),
      
      #-----------------------------------------------------------------
      # TAB 3: Information
      tabItem(tabName = TabNames[4],
              #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              ## Row 1 - First 4 boxes
              h1("Tab 4")
      )
      #-----------------------------------------------------------------
      
    )
    )
  )
  # tabItems
  # body
  #=========================================================================
  # END DASHBOARD
  #=========================================================================
# dashboard page

##############################################################################
# TAB 2: SERVER
##############################################################################
# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
}
##############################################################################
# RUN APPLICATION
##############################################################################
shinyApp(ui = ui, server = server)
##############################################################################
################################### END ######################################
##############################################################################
