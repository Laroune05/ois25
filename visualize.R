# -*- coding: utf-8 -*-
# ---
# jupyter:
#   jupytext:
#     text_representation:
#       extension: .R
#       format_name: light
#       format_version: '1.5'
#       jupytext_version: 1.16.4
#   kernelspec:
#     display_name: R
#     language: R
#     name: ir
# ---

# +
# visualize.R

# Charger les packages nécessaires
if (!require("ggplot2")) install.packages("ggplot2", dependencies=TRUE)
if (!require("reshape2")) install.packages("reshape2", dependencies=TRUE)

library(ggplot2)
library(reshape2)

# Utiliser le jeu de données intégré 'mtcars'
data(mtcars)

# Calculer la matrice de corrélation
cor_matrix <- round(cor(mtcars), 2)

# Réorganiser les données pour ggplot
melted_cor <- melt(cor_matrix)

# Créer une heatmap avec ggplot2
heatmap <- ggplot(data = melted_cor, aes(x=Var1, y=Var2, fill=value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white",
                       midpoint = 0, limit = c(-1,1), space = "Lab",
                       name="Correlation") +
  geom_text(aes(label = value), color = "black", size = 4) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1,
                                   size = 12, hjust = 1)) +
  coord_fixed()

# Afficher la heatmap
print(heatmap)
# -


