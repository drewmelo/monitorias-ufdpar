getwd()

# Instalando pacotes ------------------------------------------------------
install.packages("tidyverse")

library(tidyverse)

# função
search() # função

# Operações aritméticas ---------------------------------------------------
A <- (2 + 2) / 4

a <- c(2, 3, 2.54)

sqrt(a)

b <- c("A", "B", "C")


# Dúvida com pacotes ------------------------------------------------------
?dplyr::arrange

# Vetores -----------------------------------------------------------------
# Vetor numérico (inteiro)
ano <- c(2022, 2023, 2024, 2025)

ano2 <- c(2022:2025)

# Vetor de caracteres
revistas <- c("A", "B", "C", "B")

# Vetor númerico (números reais)
impacto <- c(2.75, 1.91, 5.23, 0.87)

# Criando data frames -----------------------------------------------------
df <- data.frame(
  nome = c("Ana", "João", "Gabriel", "Ana"),
  ano = ano,
  revistas = revistas,
  impacto = impacto
)

df

class(df$ano)

as_tibble(df)

# integer < numeric < character
df <- data.frame(
  nome = c("Ana", "João", "Gabriel", "Ana"),
  ano = ano,
  revistas = revistas,
  impacto = impacto
)

resultado <- df |>
  filter(ano >= 2023) |>
  group_by(revistas) |>
  reframe(media_impacto = mean(impacto, na.rm = T),
          total_impacto = sum(impacto, na.rm = T)) |>
  arrange(desc(media_impacto))

# Retornar de tibble para data.frame (classe)
as.data.frame(df)

df2 <- filter(.data = df, ano >= 2023)

2 + 3 + 5 + NA

# Exportando os dados ----------------------------------------------------
df <- as_tibble(df)

# Separação por vírgula
write.csv(df,
          file = "tecnicas-pesquisa-economia/dados/dados.csv",
          row.names = F)
# Separação ponto e vírgula
write.csv2(df,
          file = "tecnicas-pesquisa-economia/dados/dados.csv",
          row.names = F)

# Importando dados
dados <- read_csv(file = "tecnicas-pesquisa-economia/dados/dados.csv")

# Removendo objetos do ambiente

# um único objeto
rm(ano2)

# todos os objetos
rm(list = ls())
