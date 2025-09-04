library(tidyverse)
library(sf)
library(geobr)
library(plotly)

df <- read_csv("C:/Users/karol/Downloads/Cruzamentos/base_limpa.csv")

# CORREÇÃO PRINCIPAL: Usar code_micro = 33 para o estado do Rio de Janeiro
micro_regions <- read_micro_region(code_micro = 33, year = 2020)

# Passo 2: Limpar os dados removendo 'Dado não fornecido/inconsistente'
df_clean <- df %>%
  filter(Coluna13 != "Dado não fornecido/inconsistente") 

# Passo 3: Unificar METROPOLITANA I e METROPOLITANA II
df_clean <- df_clean %>%
  mutate(Coluna2 = case_when(
    Coluna2 %in% c("OF - METROPOLITANA I", "OF - METROPOLITANA II") ~ "OF - METROPOLITANA",
    TRUE ~ Coluna2
  ))

# Passo 4: Calcular proporção de raça por região (CORRIGIDO)
prop_raca <- df_clean %>%
  group_by(Coluna2, Coluna13) %>%
  summarise(contagem = n(), .groups = "drop") %>%
  group_by(Coluna2) %>%
  mutate(proporcao = contagem / sum(contagem)) %>%
  ungroup() %>%
  select(Coluna2, Coluna13, proporcao) %>%  # CORREÇÃO: Remover coluna contagem antes do pivot
  pivot_wider(names_from = Coluna13, values_from = proporcao, values_fill = 0)

# DIAGNÓSTICO: Verificar quais regiões existem na sua base
print("Regiões únicas na sua base de dados:")
print(unique(df_clean$Coluna2))

print("Dados de proporção calculados (corrigidos):")
print(prop_raca)

# Verificar os nomes das microrregiões disponíveis
print("Nomes das microrregiões no shapefile:")
print(unique(micro_regions$name_micro))

print("Estrutura do objeto micro_regions:")
print(names(micro_regions))

print("Nomes das regiões nos seus dados:")
print(unique(df_clean$Coluna2))

# Passo 5: Mapear para as 8 regiões administrativas (CORRIGIDO - maiúsculo)
micro_regions <- micro_regions %>%
  mutate(nome_regiao = case_when(
    # Mapear para as regiões administrativas que você tem
    name_micro %in% c("Rio de Janeiro", "São Gonçalo", "Nova Iguaçu", "Itaguaí", "Macacu-Caceribu") ~ "OF - METROPOLITANA",
    name_micro %in% c("Itaperuna", "Santo Antônio de Pádua") ~ "OF - NOROESTE",
    name_micro %in% c("Campos dos Goytacazes", "Macaé", "Lagos") ~ "OF - NORTE",
    name_micro %in% c("Nova Friburgo", "Santa Maria Madalena", "Cantagalo-Cordeiro") ~ "OF - SERRANA",
    name_micro %in% c("Vassouras", "Barra do Piraí", "Três Rios") ~ "OF - CENTRO SUL",
    name_micro == "Baía da Ilha Grande" ~ "OF - BAÍA DA ILHA GRANDE",
    name_micro == "Bacia de São João" ~ "OF - BAIXADA LITORÂNEA",
    name_micro %in% c("Vale do Paraíba Fluminense", "Volta Redonda-Barra Mansa", "Paraíba do Sul") ~ "OF - MÉDIO PARAÍBA",
    TRUE ~ paste0("OF - ", toupper(name_micro))
  ))

# Verificar o mapeamento
print("Mapeamento criado:")
print(micro_regions %>% st_drop_geometry() %>% select(name_micro, nome_regiao) %>% distinct())

# Passo 6: Agregar geometria para as regiões agrupadas
micro_regions_agg <- micro_regions %>%
  group_by(nome_regiao) %>%
  summarise(
    geom = sf::st_union(geom),
    .groups = "drop"
  ) %>%
  st_make_valid()

# Passo 7: Juntar os dados
map_data <- micro_regions_agg %>%
  left_join(prop_raca, by = c("nome_regiao" = "Coluna2"))

# Verificar se o join funcionou
print("Dados após o join:")
print(map_data %>% st_drop_geometry() %>% select(nome_regiao, Branco, Negro, Amarelo))

# Passo 8: Plotar mapa individual (exemplo para Branco)
ggplot(data = map_data) +
  geom_sf(aes(fill = Branco), color = "white", size = 0.5) +
  scale_fill_gradient(low = "lightblue", high = "darkblue", na.value = "grey80",
                      labels = scales::percent_format()) +
  labs(title = "Proporção de pessoas Brancas por região no RJ",
       fill = "Proporção") +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),
    legend.position = "bottom"
  )

# Mapa com facetas para múltiplas raças
map_long <- map_data %>%
  select(nome_regiao, Branco, Negro, Amarelo, geom) %>%
  pivot_longer(cols = c(Branco, Negro, Amarelo),
               names_to = "Raca", values_to = "Proporcao")

ggplot(data = map_long) +
  geom_sf(aes(fill = Proporcao), color = "white", size = 0.3) +
  scale_fill_gradient(low = "white", high = "red", na.value = "grey80",
                      labels = scales::percent_format()) +
  facet_wrap(~Raca, ncol = 2) +
  labs(title = "Proporção por raça nas regiões do Rio de Janeiro",
       fill = "Proporção") +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),
    legend.position = "bottom",
    strip.text = element_text(size = 12)
  )



##################################################
library(tidyverse)
library(sf)
library(geobr)

df <- read_csv("C:/Users/karol/Downloads/Cruzamentos/base_limpa.csv")

# CORREÇÃO PRINCIPAL: Usar code_micro = 33 para o estado do Rio de Janeiro
micro_regions <- read_micro_region(code_micro = 33, year = 2020)

# Passo 2: Limpar os dados removendo 'Dado não fornecido/inconsistente'
df_clean <- df %>%
  filter(Coluna13 != "Dado não fornecido/inconsistente") 

# Passo 3: Unificar METROPOLITANA I e METROPOLITANA II
df_clean <- df_clean %>%
  mutate(Coluna2 = case_when(
    Coluna2 %in% c("OF - METROPOLITANA I", "OF - METROPOLITANA II") ~ "OF - METROPOLITANA",
    TRUE ~ Coluna2
  ))

# Passo 4: Calcular proporção de raça por região (CORRIGIDO)
prop_raca <- df_clean %>%
  group_by(Coluna2, Coluna13) %>%
  summarise(contagem = n(), .groups = "drop") %>%
  group_by(Coluna2) %>%
  mutate(proporcao = contagem / sum(contagem)) %>%
  ungroup() %>%
  select(Coluna2, Coluna13, proporcao) %>%  # CORREÇÃO: Remover coluna contagem antes do pivot
  pivot_wider(names_from = Coluna13, values_from = proporcao, values_fill = 0)

# DIAGNÓSTICO: Verificar quais regiões existem na sua base
print("Regiões únicas na sua base de dados:")
print(unique(df_clean$Coluna2))

print("Dados de proporção calculados (corrigidos):")
print(prop_raca)

# Verificar os nomes das microrregiões disponíveis
print("Nomes das microrregiões no shapefile:")
print(unique(micro_regions$name_micro))

print("Estrutura do objeto micro_regions:")
print(names(micro_regions))

print("Nomes das regiões nos seus dados:")
print(unique(df_clean$Coluna2))

# Passo 5: Mapear para as 8 regiões administrativas (NOMES CORRETOS)
micro_regions <- micro_regions %>%
  mutate(nome_regiao = case_when(
    # Mapear para os nomes EXATOS da sua base de dados
    name_micro %in% c("Rio De Janeiro", "São Gonçalo", "Nova Iguaçu", "Itaguaí", "Macacu-Caceribu") ~ "OF - METROPOLITANA",
    name_micro %in% c("Itaperuna", "Santo Antônio De Pádua") ~ "OF - NOROESTE",
    name_micro %in% c("Campos Dos Goytacazes", "Macaé", "Lagos") ~ "OF - NORTE",
    name_micro %in% c("Nova Friburgo", "Santa Maria Madalena", "Cantagalo-Cordeiro", "Serrana") ~ "OF - SERRANA",
    name_micro %in% c("Vassouras", "Barra Do Piraí", "Três Rios") ~ "OF - CENTRO SUL",
    name_micro == "Baía Da Ilha Grande" ~ "OF - BAÍA DA ILHA GRANDE",
    name_micro == "Bacia De São João" ~ "OF - BAIXADA LITORÂNEA",
    name_micro %in% c("Vale Do Paraíba Fluminense", "Volta Redonda-Barra Mansa", "Paraíba do Sul") ~ "OF - MÉDIO PARAÍBA",
    TRUE ~ paste0("OF - ", name_micro)
  ))

# Verificar o mapeamento
print("Mapeamento criado:")
print(micro_regions %>% st_drop_geometry() %>% select(name_micro, nome_regiao) %>% distinct())

# Passo 6: Agregar geometria para as regiões agrupadas
micro_regions_agg <- micro_regions %>%
  group_by(nome_regiao) %>%
  summarise(
    geom = sf::st_union(geom),
    .groups = "drop"
  ) %>%
  st_make_valid()

# Passo 7: Juntar os dados
map_data <- micro_regions_agg %>%
  left_join(prop_raca, by = c("nome_regiao" = "Coluna2"))

# Verificar se o join funcionou
print("Dados após o join:")
print(map_data %>% st_drop_geometry() %>% select(nome_regiao, Branco, Negro, Amarelo))

# Passo 8: Plotar mapa individual (exemplo para Branco)
ggplot(data = map_data) +
  geom_sf(aes(fill = Branco), color = "#2D3E50", size = 0.5) +
  scale_fill_gradient(low = "#fff7bc", high = "#d95f0e", na.value = "grey80",
                      labels = scales::percent_format()) +
  labs(title = "Proporção de Pessoas Brancas por região no RJ",
       fill = "Proporção") +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),
    legend.position = "bottom"
  )

ggplot(data = map_data) +
  geom_sf(aes(fill = Negro), color = "#2D3E50", size = 0.5) +
  scale_fill_gradient(low = "#efedf5", high = "#54278f", na.value = "grey80",
                      labels = scales::percent_format()) +
  labs(title = "Proporção de Pessoas Negras",
       fill = "Proporção") +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),
    legend.position = "bottom"
  )

# OPÇÃO 4: Escala customizada com valores específicos
ggplot(data = map_data) +
  geom_sf(aes(fill = Negro), color = "#2D3E50", size = 0.5) +
  scale_fill_gradient(low = "#efedf5", high = "#54278f", na.value = "grey80",
                      labels = scales::percent_format(),
                      breaks = c(0, 0.10, 0.20, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 1)) +  # Valores específicos
  labs(title = "Proporção de Pessoas Negras",
       fill = "Proporção") +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),
    legend.position = "right"
  )


# OPÇÃO 4 AJUSTADA: Valores nas pontas com 0% incluído
ggplot(data = map_data) +
  geom_sf(aes(fill = Negro), color = "#2D3E50", size = 0.5) +
  scale_fill_gradient(low = "#efedf5", high = "#54278f", na.value = "grey80",
                      labels = scales::percent_format(),
                      breaks = c(0, 0.15, 0.30, 0.45, 0.60, 0.75),  # 0%, 10% e 60%
                      limits = c(0.15, 0.6)) +  # Limites de 0% a 60%
  labs(title = "Proporção de Pessoas Negras",
       fill = "Proporção") +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),
    legend.position = "right",
    legend.key.width = unit(0.3, "cm"),
    legend.key.height = unit(1.2, "cm")
  )


ggplot(data = map_data) +
  geom_sf(aes(fill = Branco), color = "#2D3E50", size = 0.5) +
  scale_fill_gradient(low = "#deebf7", high = "#3182bd", na.value = "grey80",
                      labels = scales::percent_format(),
                      breaks = c(0, 0.50, 0.60, 0.70, 0.80),  # 0%, 10% e 60%
                      limits = c(0.40, 0.85)) +  # Limites de 0% a 60%
  labs(title = "Proporção de Pessoas Brancas",
       fill = "Proporção") +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),
    legend.position = "right",
    legend.key.width = unit(0.3, "cm"),
    legend.key.height = unit(1.2, "cm")
  )


ggplot(data = map_data) +
  geom_sf(aes(fill = Branco), color = "#2D3E50", size = 0.5) +
  scale_fill_gradient(low = "#deebf7", high = "#3182bd", na.value = "grey80",
                      labels = scales::percent_format(),
                      breaks = c(0, 0.10, 0.20, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 1)) +  # Valores específicos
  labs(title = "Proporção de Pessoas Brancas",
       fill = "Proporção") +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),
    legend.position = "right"
  )

ggplot(data = map_data) +
  geom_sf(aes(fill = Branco), color = "#2D3E50", size = 0.5) +
  scale_fill_gradient(low = "lightgreen", high = "darkgreen", na.value = "grey80",
                      labels = scales::percent_format(),
                      breaks = c(0, 0.10, 0.20, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 1)) +  # Valores específicos
  labs(title = "Proporção de Pessoas Brancas",
       fill = "Proporção") +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),
    legend.position = "right"
  )


ggplot(data = map_data) +
  geom_sf(aes(fill = Amarelo), color = "#2D3E50", size = 0.5) +
  scale_fill_gradient(low = "#fff7bc", high = "#d95f0e", na.value = "grey80",
                      labels = scales::percent_format(),
                      breaks = c(0, 0.010, 0.020, 0.030)) +  # Valores específicos
  labs(title = "Proporção de Pessoas Amarelas",
       fill = "Proporção") +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),
    legend.position = "right"
  )

# Mapa com facetas para múltiplas raças
map_long <- map_data %>%
  select(nome_regiao, Branco, Negro, Amarelo, geom) %>%
  pivot_longer(cols = c(Branco, Negro, Amarelo),
               names_to = "Raca", values_to = "Proporcao")

ggplot(data = map_long) +
  geom_sf(aes(fill = Proporcao), color = "#2D3E50", size = 0.3) +
  scale_fill_gradient(low = "lightblue", high = "darkblue", na.value = "grey80",
                      labels = scales::percent_format()) +
  facet_wrap(~Raca, ncol = 2) +
  labs(title = "Proporção por Raça nas regiões do Rio de Janeiro",
       fill = "Proporção") +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),
    legend.position = "right",
    strip.text = element_text(size = 12)
  )



# OPÇÃO 1: Versão básica interativa
p1 <- ggplot(data = map_data) +
  geom_sf(aes(fill = Negro, 
              text = paste("Região:", nome_regiao,
                           "<br>Proporção Negra:", scales::percent(Negro, accuracy = 0.1),
                           "<br>Proporção Branca:", scales::percent(Branco, accuracy = 0.1),
                           "<br>Proporção Amarela:", scales::percent(Amarelo, accuracy = 0.1))), 
          color = "#2D3E50", size = 0.3) +
  scale_fill_gradient(low = "#efedf5", high = "#54278f", na.value = "grey80",
                      labels = scales::percent_format(),
                      breaks = c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6),
                      limits = c(0, 0.6)) +
  labs(title = "Proporção de Pessoas Negras no Rio de Janeiro",
       fill = "Proporção") +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),http://127.0.0.1:47641/graphics/77208a49-8d33-43b9-bc67-4cd3cf7a1c61.png
    legend.position = "right",
    legend.key.width = unit(0.3, "cm"),
    legend.key.height = unit(1.2, "cm")
  )

# Converter para plotly
ggplotly(p1, tooltip = "text") %>%
  config(displayModeBar = FALSE) %>%  # Remove barra de ferramentas
  layout(title = list(text = "Proporção de Pessoas Negras no Rio de Janeiro", 
                      x = 0.5, xanchor = 'center'))
