library(RODBC)
library(lattice)
conn <- odbcConnect("mysqldevelopersurvey", uid="devsurvey", pwd="3aspeThu", case="tolower")
question3 <- sqlQuery(conn, "SELECT * FROM Question3")
users <- sqlQuery(conn, "SELECT distinct RespondingUser FROM Question3")

for(i in [1,26]) {
	users$RespondingUser[i]
	perceivedDistance <- question3$PerceivedDistance[question3$RespondingUser == users$RespondingUser[i]]
	weightedDNDistance <- question3$WeightedDNDistance[question3$RespondingUser == users$RespondingUser[i]]
	cor.test(perceivedDistance, weightedDNDistance, method="spearman")
}

odbcClose(conn)
rm(conn)