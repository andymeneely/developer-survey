library(RODBC)
library(lattice)
conn <- odbcConnect("mysqldevelopersurvey", uid="devsurvey", pwd="3aspeThu", case="tolower")
question3 <- sqlQuery(conn, "SELECT * FROM Question3")
users <- sqlQuery(conn, "SELECT distinct RespondingUser FROM Question3")
numRespondants = 117
results$rho <- seq(1:numRespondants)
results$project <- ""

for(i in seq(1:numRespondants) ) {
	#print(users$RespondingUser[i])
	perceivedDistance <- question3$PerceivedDistance[question3$RespondingUser == users$RespondingUser[i]]
	weightedDNDistance <- question3$WeightedDNDistance[question3$RespondingUser == users$RespondingUser[i]]
	#cor.test(perceivedDistance, weightedDNDistance, method="spearman")
	results$rho[i] <- cor(perceivedDistance, weightedDNDistance, method="spearman")
	#results$project <- question3$Project[question3$RespondingUser == users$RespondingUser[i]]
	#print(cor(perceivedDistance, weightedDNDistance, method="spearman"))
}
summary(results$rho)
t.test(results$rho)
odbcClose(conn)
rm(conn)