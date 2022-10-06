# 2022-10-04: sesión 2 de visualización de datos

# paquetes -----
library(readr)
library(dplyr)
library(ggplot2)
library(ggtext) # para editar anotaciones y etiquetas
library(gghighlight) # para destacar valores en un gráfico

# los datos -----

desarrollo <- read_csv("datos/datos-desarrollo.csv")

# un subset de nuestros datos: los países de Sudamérica

sudamerica <- filter(desarrollo, pais %in% c("Chile", "Argentina", "Uruguay", "Paraguay", "Bolivia", "Perú", "Ecuador", "Colombia", "Venezuela", "Brasil", "Suriname", "Guyana"))

# ejemplo 1: cómo agregar etiquetas 

sudamerica |> 
  filter(anio == 2020) |> 
  ggplot(aes(reorder(pais, -esperanza_vida), esperanza_vida)) +
  geom_col(fill = "turquoise4") +
  geom_text(aes(label = esperanza_vida),
            vjust = 1.5,
            color = "white",
            fontface = "bold") +
  labs(title = "Esperanza de vida en 2020",
       subtitle = "países de Sudamércia",
       x = NULL,
       y = "esperanza de vida") +
  theme_bw()

# si ejecutan colors() en la consola pueden ver todos los colores que R reconoce por nombre


# Si quisiera poner las columnas horizontales

sudamerica |> 
  filter(anio == 2020) |> 
  ggplot(aes(y = reorder(pais, esperanza_vida), esperanza_vida)) +
  geom_col(fill = "turquoise4") +
  geom_text(aes(label = esperanza_vida),
            hjust = 1.5,
            color = "white",
            fontface = "bold") +
  labs(title = "Esperanza de vida en 2020",
       subtitle = "países de Sudamércia",
       y = NULL,
       x = "esperanza de vida") +
  theme_bw()

# Ejemplo 2: Destacar valores dentro de un gráfico

ggplot(sudamerica, aes(anio, pib, color = pais)) +
  geom_line(size = 2) +
  gghighlight(pais == "Chile",
              unhighlighted_params = aes(color = "#b2d3c9")) +
  scale_color_manual(values = "#006e4e") +
  labs(title = "Comparación del PIB de Chile con el del resto de Sudamérica") +
  theme_bw()

# Ejemplo 3: cómo anotar nuestros gráficos

desarrollo |> 
  filter(pais == "Ruanda") |> 
  ggplot(aes(anio, esperanza_vida)) +
  geom_line(size = 2, color = "magenta4") +
  geom_label(aes(x = 1995, y = 10, label = "1993: año del genocidio \nde la población Tutsi"),
             hjust = -0.01,
             fill = "magenta4",
             color = "white",
             fontface = "bold") +
  scale_y_continuous(limits = c(0,80)) +
  scale_x_continuous(breaks = seq(1960, 2020, by = 10)) +
  labs(title = "Esperanza de vida en Ruanda",
       x = NULL,
       y = NULL) +
  theme_bw()


# Ejemplo 4: cómo indicar a qué corresponde cada cosa del gráfico (una alternativa a la "leyenda")

sudamerica |> 
  filter(pais %in% c("Uruguay", "Argentina")) |> 
  ggplot(aes(anio, pib, color = pais)) +
  geom_line(size = 2, show.legend = FALSE) +
  scale_color_manual(values = c("Uruguay" = "#0081a7", "Argentina" = "#f07167")) +
  labs(title = "Evolución del PIB en <b style=color:'#f07167'>Argentina</b> y <b style=color:'#0081a7'>Uruguay</b>") +
  theme_bw() +
  theme(plot.title = element_markdown())
