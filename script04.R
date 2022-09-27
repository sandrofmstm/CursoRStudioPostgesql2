# AULA 3 > 0:20:00

library(stf)
library(tidyverse)
sequencia <- seq(3810647, length.out=200)
stf_download_information(sequencia, dir = "data-raw/informacoes")
informacoes <- read_stf_information(path = "data-raw/informacoes")
informacoes

stf_download_details(informacoes$incidente, dir = "data-raw/detalhes")
detalhes <- read_stf_details(path="data-raw/detalhes")

stf_download_parties(detalhes$incidente, dir = "data-raw/partes")
partes <- stf_read_parties(path="data-raw/partes")

stf_download_sheet(detalhes$incidente, dir = "data-raw/andamento")
andamento <- read_stf_docket_sheet(path="data-raw/andamento")