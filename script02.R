install.packages(c("dm", "dbx", "DiagrammeR"))
remotes::install_github("jjesusfilho/stf")
install.packages("remotes")
install.packages("usethis")

library(stf)
incidentes <- seq(from=5896099, length.out=100)
stf_download_information(incidentes, "info")
info <- read_stf_information(path = "CursoRStudioPostgesql2/info")
info <- read_stf_information(path = "info")
info
