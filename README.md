# Rshiny_Datasets_Drugs_Psychology


# Dashboard interactif : Analyse Drogues & Psychologie

> **Explorer, comprendre et partager les liens entre traits de personnalité et consommation de substances grâce à un tableau de bord R Shiny.**

![Screenshot](assets/screenshot_dashboard_overview.jpg)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 📌 Sommaire

1. [À propos du projet](#-à-propos-du-projet)
2. [Démonstration en ligne](#-démonstration-en-ligne)
3. [Fonctionnalités clés](#-fonctionnalités-clés)
4. [Structure du dépôt](#-structure-du-dépôt)
5. [Prérequis](#-prérequis)
6. [Installation](#-installation)
7. [Lancement en local](#-lancement-en-local)
8. [Tests et validation](#-tests-et-validation)
9. [Déploiement](#-déploiement)
10. [Contribuer](#-contribuer)
11. [Auteurs](#-auteurs)
12. [Licence](#-licence)
13. [Remerciements](#-remerciements)

---

## 📊 À propos du projet

Ce tableau de bord interactif permet d'explorer les liens entre :

- **Traits de personnalité** (Big Five, impulsivité, recherche de sensations)
- **Consommation de substances** (alcool, cannabis, héroïne, etc.)
- **Facteurs démographiques** (âge, sexe, éducation, origine)

Le tout basé sur le **UCI Drug Consumption Dataset** (1854 individus × 32 variables), avec des visualisations dynamiques, des statistiques descriptives, des corrélations croisées et une interface moderne.

---

## 🌐 Démonstration en ligne

🔗 [Accéder au dashboard](https://romainjazzar.shinyapps.io/Rstudio_drug_analysis_psychology_datasets/)

---

## ⚙️ Fonctionnalités clés

| Catégorie          | Détails                                                             |
| ------------------ | ------------------------------------------------------------------- |
| **Exploration**    | Filtres dynamiques par substance, traits, démographie               |
| **Visualisations** | Graphiques interactifs (barplots, nuages, corrélations)             |
| **Statistiques**   | Moyennes, médianes, pourcentages, quartiles                         |
| **Export**         | Téléchargement des données filtrées en CSV                         |
| **Performance**    | Application fluide et réactive (< 300ms)                           |
| **Accessibilité**  | Compatible PC / mobile, contraste élevé, responsive design          |

---

## 📁 Structure du dépôt

.
├── app/ # Code principal Shiny (app.R)
├── data/ # Fichiers de données bruts et nettoyés
├── R/ # Fonctions utilitaires R
├── assets/ # Captures d'écran et images
├── docs/ # Slides xaringan (slides_fixed.Rmd)
├── renv/ # Environnement R reproductible (optionnel)
├── README.md # Ce fichier
└── LICENSE

scss
Copy
Edit

---

## 🧰 Prérequis

- **R ≥ 4.3** (recommandé : ≥ 4.4)
- Navigateurs récents (Chrome, Firefox, Edge…)
- Packages R nécessaires :

```r
install.packages(c(
  "shiny", "shinydashboard", "ggplot2", "dplyr", "DT",
  "data.table", "plotly", "stringr", "tidyr", "readr", "qs"
))
💡 Le dépôt contient un fichier renv.lock pour restaurer l’environnement exact avec :

r
Copy
Edit
install.packages(\"renv\")
renv::restore()
💻 Installation
bash
Copy
Edit
# Cloner le projet
git clone https://github.com/<votre-organisation>/drug-psych-dashboard.git
cd drug-psych-dashboard
🚀 Lancement en local
r
Copy
Edit
# Dans RStudio
# Ouvrez app/app.R et cliquez sur ▶ \"Run App\"

# OU en ligne de commande R
shiny::runApp('app', port = 4242, launch.browser = TRUE)
L’application sera disponible sur : http://localhost:4242

✅ Tests et validation
Validation standard : R CMD check --as-cran

Linting : lintr::lint_package()

Tests unitaires (si présents) : testthat::test_dir('tests')

🚢 Déploiement
ShinyApps.io (interface RStudio)
Installez rsconnect : install.packages(\"rsconnect\")

Cliquez sur Publish dans RStudio, sélectionnez le dossier app/ et suivez les étapes.

Serveur Shiny via Docker
bash
Copy
Edit
docker build -t drug-psych-dashboard .
docker run -d -p 4242:3838 --name dashboard drug-psych-dashboard
GitHub Pages (slides uniquement)
Les slides docs/slides_fixed.Rmd sont exportées en HTML auto-contenu. Activez GitHub Pages sur le dossier docs/.

🤝 Contribuer
Les contributions sont bienvenues !

Fork du dépôt

Créez une branche : git checkout -b feature/ma-fonction

Commitez vos changements : git commit -m 'feat: ajout fonctionalité'

Pushez et ouvrez une Pull Request ✨

👥 Auteurs
Romain Jazzar

Lisa Crebassa

Mohammed Zelmati

Projet réalisé dans le cadre de La Plateforme - Bachelor IA Promotion 2025

🪪 Licence
Distribué sous licence MIT. Voir le fichier LICENSE pour plus d’infos.

🙏 Remerciements
Dataset original : UCI Machine Learning Repository

L’écosystème R Shiny

Nos professeurs et évaluateurs pour leurs retours utiles
