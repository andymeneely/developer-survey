library(RODBC)
library(lattice)
conn <- odbcConnect("mysqldevelopersurvey", uid="devsurvey", pwd="3aspeThu", case="tolower")
question4 <- sqlQuery(conn, "SELECT * FROM Question4Summary")

q4matrix[1] <- question4$Choice0
q4matrix[2] <- question4$Choice1
q4matrix[3] <- question4$Choice2
q4matrix[4] <- question4$Choice3
q4matrix[5] <- question4$Choice4
q4matrix[6] <- question4$Choice5
q4matrix[7] <- question4$Choice6
q4matrix[8] <- question4$Choice7

cor(q4matrix)

odbcClose(conn)
rm(conn)