# Fixer le bon dossier de travail
setwd("C:/Users/Utilisateur/OneDrive/Desktop/R u shiny/Shiny Web Application")

# Charger les packages
library(dplyr)
library(ggplot2)

# Charger le dataset
data <- read.csv("Drug_Consumption_Cleaned.csv", stringsAsFactors = TRUE)

# Afficher la structure
str(data)

# Voir les 6 premières lignes
head(data)

# Résumé statistique
summary(data)

# Compter les valeurs manquantes
colSums(is.na(data))

# Boxplots pour visualiser les valeurs extrêmes
boxplot(data$Nscore, main = "Score Neuroticisme (Nscore)", col = "orange")
boxplot(data$Impulsive, main = "Score d'impulsivité", col = "red")

# Histogramme simple de consommation de Cannabis
ggplot(data, aes(x = Cannabis)) +
  geom_bar(fill = "darkgreen") +
  theme_minimal() +
  labs(title = "Consommation de Cannabis", x = "Fréquence", y = "Utilisateurs")

# 🔁 Pour tester rapidement d'autres drogues :
drug_vars <- names(data)[which(names(data) == "Alcohol"):ncol(data)]

# Créer un graphique pour chaque drogue (exemple sur les 5 premières)
for (drug in head(drug_vars, 5)) {
  print(
    ggplot(data, aes_string(x = drug)) +
      geom_bar(fill = "steelblue") +
      theme_minimal() +
      labs(title = paste("Fréquence d'utilisation de", drug),
           x = "Catégorie", y = "Nombre d'utilisateurs")
  )
}
