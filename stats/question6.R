library(RODBC)
library(lattice)
conn <- odbcConnect("mysqldevelopersurvey", uid="devsurvey", pwd="3aspeThu", case="tolower")

q6 <- sqlQuery(conn, "SELECT * FROM Question6")
experts <- sqlQuery(conn, "SELECT * FROM Experts WHERE NumVotes>=3")
dc <- sqlQuery(conn, "SELECT * FROM DeveloperCentrality WHERE USER NOT IN (SELECT expert FROM experts)")
sc <- sqlQuery(conn, "SELECT * FROM SteeringCentrality")

#Linux Expert & Centrality
summary(experts$Betweenness[experts$Project == "Linux kernel"])
summary(dc$Betweenness[dc$Project=="Linux kernel"])
summary(experts$Degree[experts$Project == "Linux kernel"])
summary(dc$Degree[dc$Project=="Linux kernel"])
wilcox.test(experts$Betweenness[experts$Project == "Linux kernel"], dc$Betweenness[dc$Project=="Linux kernel"])
wilcox.test(experts$Degree[experts$Project == "Linux kernel"], dc$Degree[dc$Project=="Linux kernel"])


#PHP Expert & Centrality
summary(experts$Betweenness[experts$Project == "PHP"])
summary(dc$Betweenness[dc$Project=="PHP"])
summary(experts$Degree[experts$Project == "PHP"])
summary(dc$Degree[dc$Project=="PHP"])
wilcox.test(experts$Betweenness[experts$Project == "PHP"], dc$Betweenness[dc$Project=="PHP"])
wilcox.test(experts$Degree[experts$Project == "PHP"], dc$Degree[dc$Project=="PHP"])

#Wireshark Expert & Centrality
summary(experts$Betweenness[experts$Project == "Wireshark"])
summary(dc$Betweenness[dc$Project=="Wireshark"])
summary(experts$Degree[experts$Project == "Wireshark"])
summary(dc$Degree[dc$Project=="Wireshark"])
wilcox.test(experts$Betweenness[experts$Project == "Wireshark"], dc$Betweenness[dc$Project=="Wireshark"])
wilcox.test(experts$Degree[experts$Project == "Wireshark"], dc$Degree[dc$Project=="Wireshark"])


odbcClose(conn)
rm(conn)