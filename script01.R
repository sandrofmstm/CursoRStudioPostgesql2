install.packages("RPostgres")


library(DBI)
conn <- dbConnect(RPostgres::Postgres(),host="192.168.1.5", user="sandro", password="sandro123", dbname="base1")
dbWriteTable(conn, "mtcars", mtcars)

library(dplyr)
library(dbplyr)
SANDRO_TB <- tbl(conn, "mtcars") %>% select(mpg, cyl) %>% filter(cyl == 8) %>% collect()
SANDRO_TB
SANDRO_TB2 <- dbGetQuery(conn, "select cyl, mpg from mtcars where cyl = 6")
SANDRO_TB2

