# AULA 3 > 0:20:00

library(stf)
library(tidyverse)
sequencia <- seq(3810647, length.out=200)
stf_download_information(sequencia, dir = "data-raw/informacoes")
informacoes <- read_stf_information(path = "data-raw/informacoes")
informacoes

stf_download_details(informacoes$incidente, dir = "data-raw/informacoes")
detalhes <- read_stf_details(path="data-raw/informacoes")

stf_download_parties(detalhes$incidente, dir = "data-raw/informacoes")
partes <- stf_read_parties(path="data-raw/informacoes")
