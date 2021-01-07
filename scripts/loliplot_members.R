library(ggplot2)
library(dplyr)

df <- data.frame(
  Capitulo= c("CDMX","Xalapa","Querétaro","Puebla","Cuernavaca","Pachuca","Monterey","Aguascalientes","Tijuana"),
  Miembros2020= c(1535,246,319,117,360,9,216,13,13),
  Miembros = c(1776,402,521,201,474,11,302,311,47)
)


df %>%
  arrange(Miembros) %>%    # First sort by val. This sort the dataframe but NOT the factor levels
  mutate(Capitulo=factor(Capitulo, levels=Capitulo)) %>%   # This trick update the factor levels
  ggplot( aes(x=Capitulo, y=Miembros)) +
  geom_segment( aes(xend=Capitulo, yend=0)) +
  geom_point( size=12, color="#88398A", alpha = 1) +
  geom_text(aes(label = Miembros), hjust = +.5, size=4, color = "#ffffff") +
  expand_limits(y = 1800) +
  coord_flip() +
  theme_bw(20) +
  xlab("")
