# Nettoyage et transformation du dataset

# Charger les packages nécessaires
library(dplyr)
library(ggplot2)

# Charger les données brutes
data <- read.csv("Drug_Consumption.csv", stringsAsFactors = TRUE)

# Vérifier les valeurs manquantes
missing_vals <- colSums(is.na(data))
print("Valeurs manquantes par colonne :")
print(missing_vals)

# Supprimer les colonnes qui ne varient pas (facultatif)
data <- data[, sapply(data, function(col) length(unique(col)) > 1)]

# Suppression des valeurs aberrantes dans les traits psychologiques avec Z-score
zscore <- function(x) (x - mean(x)) / sd(x)

psych_traits <- c("Nscore", "Escore", "Oscore", "AScore", "Cscore", "Impulsive", "SS")

# Supprimer les lignes ayant un Z-score > 3 (valeurs extrêmes)
for (trait in psych_traits) {
  z <- zscore(data[[trait]])
  data <- data[abs(z) <= 3, ]
}

# Renommer les colonnes si nécessaire (par exemple simplifier)
names(data)[names(data) == "Education"] <- "Niveau_Education"
names(data)[names(data) == "Country"] <- "Pays"

# Sauvegarder le dataset nettoyé (si besoin pour Shiny)
write.csv(data, "Drug_Consumption_Cleaned.csv", row.names = FALSE)

# Afficher un aperçu
str(data)
summary(data)

