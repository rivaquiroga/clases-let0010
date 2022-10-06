# Visualización de datos con ggplot2

# Paquetes ----
library(readr)
library(dplyr)
library(ggplot2)
library(forcats) # para trabajar con variables de tipo factor

# Importar los datos ----

desarrollo <- read_csv("datos/datos-desarrollo.csv")

# Gráfico 1: PIB de Chile ----

desarrollo |> 
  filter(pais == "Chile", anio >= 2000) |> 
  ggplot(aes(x = anio, y = pib)) +
  geom_line(color = "#79d0cc", size = 1)  +
  geom_point(color = "#20b2aa", size = 2) +
  scale_y_continuous(limits = c(0, 14000), labels = scales::dollar) +
  labs(title = "Producto Interno Bruto (PIB) de Chile",
       subtitle = "período entre 2000 y 2020",
       y = "PIB en dólares",
       x = NULL,
       caption = "Elaboración propia a partir de datos del Banco Mundial") +
  theme_bw()

# guardar el gráfico con un comando

ggsave("figuras/linea-pib-chile.png", width = 10, height = 7)

# Gráfico 2: Vamos a agregar más países y miraremos otra variable


# Antes: si no usáramos el "pipe", tendríamos que guardar nuestros datos filtrados en un objeto intermedio antes de hacer el gráfico.

cono_sur <- filter(desarrollo, pais %in% c("Chile", "Argentina", "Uruguay"))

ggplot(cono_sur, aes(x = anio, y = esperanza_vida)) +
  geom_line()


colores_paises <- c("Chile" = "#a8e6cf", "Argentina" = "#ff8b94", "Uruguay" = "#ffd3b6")


desarrollo |> 
  filter(pais %in% c("Chile", "Argentina", "Uruguay")) |> 
  ggplot(aes(x = anio, y = esperanza_vida, color = fct_reorder2(pais, anio, esperanza_vida))) +
  geom_line(size = 1) +
  scale_y_continuous(limits = c(0, 85)) +
  scale_x_continuous(breaks = seq(1960, 2020, by = 10)) +
  scale_color_manual(values = colores_paises) +
  labs(title = "Evolución de la esperanza de vida en Chile, Argentina y Uruguay",
       subtitle = "(1960-2020)",
       x = NULL,
       y = "esperanza vida",
       color = NULL) +
  theme_bw() +
  theme(legend.position = "bottom")


