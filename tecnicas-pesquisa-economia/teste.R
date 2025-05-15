library(tidyverse)

dados <- read_csv("tecnicas-pesquisa-economia/dados/medium_data.csv") |>
  select(-c(url, id, subtitle, image)) |>
  rename(
    titulo = title,
    curtidas = claps,
    respostas = responses,
    tempo_de_leitura = reading_time,
    publicadora = publication
  ) |>
  mutate(
    ano = year(date),  # Aqui sim! extrai o ano a partir da data
    curtidas = as.integer(curtidas),
    respostas = as.integer(respostas),
    tempo_de_leitura = as.integer(tempo_de_leitura)
  ) |> 
  select(-date)

glimpse(dados)

write.csv(dados, "tecnicas-pesquisa-economia/dados/medium_dados.csv", row.names = F)

dados <- read_csv("tecnicas-pesquisa-economia/dados/medium_dados.csv")

dados |> 
  group_by(publicadora) |> 
  reframe(media_leitura = mean(tempo_de_leitura, na.rm = T),
          total_respostas = sum(respostas, na.rm = T), # mostra NA, caso remover na.rm = T
          total_curtidas = sum(curtidas, na.rm = T)) |> 
  mutate(
    prop_curtidas = (total_curtidas / sum(total_curtidas)) * 100
  ) |> 
  select(-total_curtidas) |> 
  arrange(desc(prop_curtidas))
