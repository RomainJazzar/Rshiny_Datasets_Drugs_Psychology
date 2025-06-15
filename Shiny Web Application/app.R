# app.R 
library(shiny)
library(ggplot2)
library(dplyr)
library(DT)
library(gridExtra)

# Charger les données nettoyées
clean_data <- read.csv("Drug_Consumption_Cleaned.csv", stringsAsFactors = TRUE)

# Variables disponibles
drug_vars <- names(clean_data)[which(names(clean_data) == "Alcohol"):ncol(clean_data)]
trait_vars <- c("Nscore", "Escore", "Oscore", "AScore", "Cscore", "Impulsive", "SS")

# UI
ui <- fluidPage(
  titlePanel("Analyse des Données : Drogues & Psychologie"),
  
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("selectedDrug", "Choisissez une ou plusieurs drogues :", 
                         choices = drug_vars, selected = drug_vars[1:3]),
      checkboxGroupInput("selectedTrait", "Choisissez un ou plusieurs traits de personnalité :", 
                         choices = trait_vars, selected = trait_vars[1]),
      selectInput("selectedGender", "Genre :", 
                  choices = c("Tous", levels(clean_data$Gender))),
      selectInput("selectedAge", "Tranche d'âge :", 
                  choices = c("Toutes", levels(clean_data$Age))),
      helpText("Filtrez les données pour explorer la consommation et les liens avec la personnalité.")
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Consommation", plotOutput("drugPlot")),
        tabPanel("Trait de personnalité", plotOutput("traitPlot")),
        tabPanel("Corrélation", plotOutput("scatterPlot")),
        tabPanel("Résumé statistique", verbatimTextOutput("summary")),
        tabPanel("Tableau des données", DTOutput("table"))
      )
    )
  )
)

# SERVER
server <- function(input, output) {
  
  filtered <- reactive({
    df <- clean_data
    if (input$selectedGender != "Tous") {
      df <- df[df$Gender == input$selectedGender, ]
    }
    if (input$selectedAge != "Toutes") {
      df <- df[df$Age == input$selectedAge, ]
    }
    df
  })
  
  # Graphique consommation
  output$drugPlot <- renderPlot({
    req(input$selectedDrug)
    plots <- lapply(input$selectedDrug, function(drug) {
      ggplot(filtered(), aes_string(x = drug)) +
        geom_bar(fill = "steelblue") +
        theme_minimal() +
        labs(title = paste("Consommation de", drug), x = "Fréquence", y = "Nombre")
    })
    do.call(grid.arrange, plots)
  })
  
  # Graphique traits de personnalité
  output$traitPlot <- renderPlot({
    req(input$selectedTrait)
    plots <- lapply(input$selectedTrait, function(trait) {
      ggplot(filtered(), aes_string(x = trait)) +
        geom_histogram(fill = "orange", bins = 30) +
        theme_minimal() +
        labs(title = paste("Distribution de", trait), x = "Score", y = "Nombre")
    })
    do.call(grid.arrange, plots)
  })
  
  # Corrélation
  output$scatterPlot <- renderPlot({
    req(length(input$selectedDrug) >= 1)
    plots <- lapply(input$selectedDrug, function(drug) {
      ggplot(filtered(), aes_string(x = input$selectedTrait[1], y = drug)) +
        geom_jitter(alpha = 0.3, color = "darkred") +
        theme_minimal() +
        labs(title = paste(input$selectedTrait[1], "vs", drug),
             x = input$selectedTrait[1], y = drug)
    })
    do.call(grid.arrange, plots)
  })
  
  # Résumé statistique
  output$summary <- renderPrint({
    vars <- c(input$selectedTrait, input$selectedDrug)
    summary(filtered()[, vars, drop = FALSE])
  })
  
  # Table interactive
  output$table <- renderDT({
    datatable(filtered(), options = list(pageLength = 10))
  })
}

# Run the app
shinyApp(ui = ui, server = server)
