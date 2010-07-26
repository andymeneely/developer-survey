library(RODBC)
library(lattice)
conn <- odbcConnect("mysqldevelopersurvey", uid="devsurvey", pwd="3aspeThu", case="tolower")
question4 <- sqlQuery(conn, "SELECT * FROM Question4Summary")
summary(question4)

q4matrix <- sqlQuery(conn, "SELECT Choice0,Choice1,Choice2,Choice3,Choice4,Choice5,Choice6,Choice7 FROM Question4Summary")
cor.test(question4$Choice2, question4$Choice3, method="pearson")

odbcClose(conn)
rm(conn)