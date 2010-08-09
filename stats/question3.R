library(RODBC)
library(lattice)
conn <- odbcConnect("mysqldevelopersurvey", uid="devsurvey", pwd="3aspeThu", case="tolower")
question3 <- sqlQuery(conn, "SELECT * FROM Question3")
users <- sqlQuery(conn, "SELECT distinct RespondingUser FROM Question3")
numRespondants = 117
results <- list(1:3)
results$rhoWeighted <- seq(1:numRespondants)
results$rhoUnWeighted <- seq(1:numRespondants)
results$project <- seq(1:numRespondants)

for(i in seq(1:numRespondants) ) {
	#print(users$RespondingUser[i])
	perceivedDistance <- question3$PerceivedDistance[question3$RespondingUser == users$RespondingUser[i]]
	weightedDNDistance <- question3$WeightedDNDistance[question3$RespondingUser == users$RespondingUser[i]]
	unweightedDNDistance <- question3$UnweightedDNDistance[question3$RespondingUser == users$RespondingUser[i]]
	results$rhoWeighted[i] <- cor(perceivedDistance, weightedDNDistance, method="spearman")
	results$rhoUnWeighted[i] <- cor(perceivedDistance, unweightedDNDistance, method="spearman")
	#results$project[i] <- question3$Project[question3$RespondingUser == users$RespondingUser[i]]

	print("-----------")
	print(unweightedDNDistance)
	print(perceivedDistance)
	print(cor(perceivedDistance, unweightedDNDistance, method="spearman"))
}
#Avg of Spearmans for Weighted Distances
summary(results$rhoWeighted)
t.test(results$rhoWeighted)

#Avg of Spearmans for Unweighted Distances
summary(results$rhoUnWeighted)
t.test(results$rhoUnWeighted)



odbcClose(conn)
rm(conn)