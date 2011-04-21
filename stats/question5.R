library(RODBC)
library(lattice)
conn <- odbcConnect("mysqldevelopersurvey", uid="devsurvey", pwd="3aspeThu", case="tolower")
q5 <- sqlQuery(conn, "SELECT * FROM Question5View")
allDist <- sqlQuery(conn, "SELECT * FROM AllDistances")

#Summary for all developer distances
summary(q5$UnweightedDistance)
t.test(q5$UnweightedDistance)
#hist(q5$UnweightedDistance)

#Summary for Linux kernel
summary(q5$UnweightedDistance[q5$Project == "Linux kernel"])
t.test(q5$UnweightedDistance[q5$Project == "Linux kernel"])
#Number of reported collaborators 
numCollab <- length(q5$UnweightedDistance[q5$Project == "Linux kernel"])
numCollab
#Percentage of reported collaborators 
length(q5$UnweightedDistance[q5$Project == "Linux kernel" & q5$UnweightedDistance==1]) / numCollab
length(q5$UnweightedDistance[q5$Project == "Linux kernel" & q5$UnweightedDistance==2]) / numCollab
length(q5$UnweightedDistance[q5$Project == "Linux kernel" & q5$UnweightedDistance==3]) / numCollab


#Summary for PHP
summary(q5$UnweightedDistance[q5$Project == "PHP"])
t.test(q5$UnweightedDistance[q5$Project == "PHP"])
#Number of reported collaborators 
numCollab <- length(q5$UnweightedDistance[q5$Project == "PHP"])
numCollab
#Percentage of reported collaborators 
length(q5$UnweightedDistance[q5$Project == "PHP" & q5$UnweightedDistance==1]) / numCollab
length(q5$UnweightedDistance[q5$Project == "PHP" & q5$UnweightedDistance==2]) / numCollab
length(q5$UnweightedDistance[q5$Project == "PHP" & q5$UnweightedDistance==3]) / numCollab


#Summary for Wireshark
summary(q5$UnweightedDistance[q5$Project == "Wireshark"])
t.test(q5$UnweightedDistance[q5$Project == "Wireshark"])
#Number of reported collaborators 
numCollab <- length(q5$UnweightedDistance[q5$Project == "Wireshark"])
numCollab
#Percentage of reported collaborators 
length(q5$UnweightedDistance[q5$Project == "Wireshark" & q5$UnweightedDistance==1]) / numCollab
length(q5$UnweightedDistance[q5$Project == "Wireshark" & q5$UnweightedDistance==2]) / numCollab
length(q5$UnweightedDistance[q5$Project == "Wireshark" & q5$UnweightedDistance==3]) / numCollab


#Comparison with the population
wilcox.test(q5$UnweightedDistance, allDist$unweighteddistance)
wilcox.test(q5$UnweightedDistance[q5$Project == "Linux kernel"], allDist$unweighteddistance)
wilcox.test(q5$UnweightedDistance[q5$Project == "PHP"], allDist$unweighteddistance)
wilcox.test(q5$UnweightedDistance[q5$Project == "Wireshark"], allDist$unweighteddistance)

odbcClose(conn)
rm(conn)