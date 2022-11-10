# Sesión 3 de visualización de datos

# los paquetes ----

library(readr)
library(dplyr)
library(ggplot2)
library(showtext)
library(ggthemes)

# Ejemplo 1: "facetas" ("facets")

cada_cinco <- desarrollo |> 
  group_by(pais) |> 
  filter(row_number() %% 5 == 1)

ggplot(cada_cinco, aes(pib, esperanza_vida, size = poblacion)) +
  geom_point(alpha = 0.2) +
  scale_x_log10(label = scales::dollar) +
  scale_y_continuous(limits = c(0,90), breaks = seq(0,80, by = 20)) +
  facet_wrap(vars(continente)) +
  theme_minimal()


# Ejemplo: cómo modificar el "tema"

# cómo definir la fuente tipográfica

font_add_google(name = "Lato", family = "Lato")
showtext_auto()

grafico <- desarrollo |> 
  filter(pais %in% c("Argentina", "Chile", "Uruguay")) |> 
  ggplot(aes(anio, pib, color = pais)) +
  geom_line(size = 2) +
  scale_color_colorblind() +
  labs(title = "Evolución del PIB en Argentina, Chile y Uruguay",
       x = NULL,
       y = "PIB en dólares",
       color = "país")


grafico + 
  theme(
    text = element_text(family = "Lato"),
    plot.title = element_text(size = 24),
    axis.text = element_text(size = 15), 
    axis.title.y = element_text(size = 15),
    legend.position = "top",
    legend.justification = "left",
    legend.text = element_text(size = 14),
    panel.grid.major.y = element_line(color = "gray40"),
    panel.grid.minor.y = element_line(color = "gray30"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    plot.background = element_rect(fill = "#f3fafd"),
    legend.background = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_line(size = 2)
  ) 
  
