
library(stf)
sequencia <- seq(6000000L,length.out=100)
sequencia
stf_download_information(sequencia, dir = "data-raw/informacoes")
info <- read_stf_information(path="data-raw/informacoes")

install.packages(tidyverse)
library(tidyverse)

# Select  (relacionado a colunas) -----------------------------------------

s1 <- select(info, 1:3)
s2 <- select(info, assunto1,assunto3)
s3 <- select(info, assunto3 : origem)
s4 <- select(info, -orgao_origem)
s5 <- select(info, starts_with("assunto"))
s6 <- select(info, ends_with("origem"))
s7 <- select(info, matches("\\d"))


# filter (relacionado a linhas) -------------------------------------------

f1 <- filter(info, origem=="SÃO PAULO")
f2 <- filter(info, origem=="SÃO PAULO"| origem=="SERGIPE")
f3 <- filter(info, str_detect(orgao_origem, "TRIBUNAL"))
f4 <- filter(info, !is.na(assunto1))


# Count () ----------------------------------------------------------------

count(info, origem)
count(info, origem, assunto1, sort=TRUE)


# Mutate (transformar ou criar novas colunas) -----------------------------

library(lubridate)

info <- info %>% mutate(ano_protocolo = year(data_protocolo))
info <- info %>% mutate(mes_protocolo =month(data_protocolo),.after=data_protocolo)
info <- info %>% mutate(mes_protocolo =month(data_protocolo, abbr = F, label = T),.after=data_protocolo)
info <- info %>% mutate(dia_protocolo =day(data_protocolo),.after=data_protocolo)


# separete (separa colunas em duas) unite (modificar elemento) -------------

info <- info %>% separate(procedencia, into = c("uf", "estado"), sep = "-")
info <- info %>% unite(col = procedencia, uf, estado, sep = "/")


# arrange (serve para ordenar) --------------------------------------------

info <- info %>% arrange(dia_protocolo)
info <- info %>% arrange(desc(dia_protocolo))


# Summarise ---------------------------------------------------------------

library(janitor)

View(iris)
iris2 <- iris %>% clean_names()
sumario <- iris %>% group_by(Species) %>% summarise(media = mean(Petal.Length))
sumario <- iris %>% group_by(Species) %>% 
           summarise(media = mean(Petal.Length), desvio = sd(Petal.Length))





