library(RODBC)
library(lattice)
conn <- odbcConnect("mysqldevelopersurvey", uid="devsurvey", pwd="3aspeThu", case="tolower")

q6 <- sqlQuery(conn, "SELECT * FROM Question6")
experts <- sqlQuery(conn, "SELECT * FROM Experts")



odbcClose(conn)
rm(conn)