# Datos

En esta carpeta vamos a guardar los datos que usemos en clases.

## `datos-desarrollo.csv`

Este set de datos contiene siete variables:

| variable         | tipo     | descripción                                                                                          |
|------------------|----------|------------------------------------------------------------------------------------------------------|
| `pais`           | caracter | Nombre del país                                                                                      |
| `anio`           | numérica | Año de la observación (1960 a 2020)                                                                  |
| `esperanza_vida` | numérica | Esperanza de vida al nacer en años                                                                   |
| `pib`            | numérica | PIB per cápita en dólares (ajustados a dólares de 2015)                                              |
| `poblacion`      | numérica | Población                                                                                            |
| `iso3`           | caracter | Código ISO de tres caracteres                                                                        |
| `continente`     | caracter | El continente en que se encuentra el país. América del Norte, Centro y Sur aparecen como "Américas". |

Los datos fueron obtenidos del sitio del Banco Mundial en el caso de la variable `pib` y de la página del proyecto Gapminder en el caso de las variables `esperanza_vida` y `poblacion`. Los archivos utilizados se encuentra en la carpeta `/datos/datos-sin-procesar`.

El código utilizado para crear este set de datos se encuentra disponible en `/codigo/2022-09-13_limpieza-datos.R`.
