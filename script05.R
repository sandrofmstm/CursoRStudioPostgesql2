install.packages("RPostgres")
install.packages("dbx")

library(dbx)
library(tidyverse)

library(DBI)
conn2 <- DBI::dbConnect(RPostgres::Postgres(),
                        host="localhost", 
                        user="sandro", 
                        password="sandro123", 
                        dbname="base1",
                        port= 5433)

dbExecute(conn2, "create schema stf")

# Define o schema stf como padrão
dbExecute(conn2, "set search_path = stf")

glimpse(informacoes)

# cria uma tabela e adiconar/popula os valores de uma vez (para bases muito grandes pode dar problema)
# em uma tabela com 1milhao de linha se de problema pede-se tudo
dbWriteTable(conn2, 'informacoes2-teste', informacoes)

# Criando uma tabela no Postgresql (cria as variaveis, mas sem dados)
# é mais seguro pois podemos criar uma tabela e depois pode usar uma função
# para ir inserindo digamos 1mil linhas por vez
dbCreateTable(conn2, 'informacoes', informacoes)
dbListTables(conn2)
dbGetQuery(conn2, 'table informacoes')

# Populando a table criada acima
dbxInsert(conn2, 'informacoes', informacoes)






dbDisconnect(conn2)