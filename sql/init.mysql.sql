CREATE TABLE Users(
	User        VARCHAR(50),
	Password    VARCHAR(33),
	Role        enum('user','admin') NOT NULL DEFAULT 'user',
	Name        VARCHAR(100),
	Project		VARCHAR(50),
	PRIMARY KEY (User)
); 

CREATE TABLE Distance(
	User1       VARCHAR(50),
	User2    	VARCHAR(50),
	Distance	DOUBLE,
	PRIMARY KEY(User1, User2)
);

CREATE VIEW UserCross AS
	SELECT u1.user user1, u2.user user2 
	FROM users u1, users u2 
	WHERE strcmp(u1.user, u2.user)<0 AND u1.project=u2.project
;

CREATE VIEW AllDistances AS
SELECT uo.user1, uo.user2, IF(distance IS NULL, 100, distance) distance 
FROM distance d RIGHT OUTER JOIN UserCross uo
  ON (d.user1=uo.user1 AND d.user2=uo.user2);

CREATE TABLE Survey(
	User        VARCHAR(50),
	Question    INTEGER,
	Answer		VARCHAR(500),
	Updated		TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 

CREATE  TABLE Question3 (
  id INT NOT NULL AUTO_INCREMENT ,
  RespondingUser VARCHAR(100) NOT NULL ,
  OtherUser VARCHAR(100) NOT NULL ,
  PerceivedDistance DOUBLE NOT NULL ,
  WeightedDNDistance DOUBLE NOT NULL ,
  Project VARCHAR(45) NOT NULL ,
  PRIMARY KEY (id) 
);

CREATE  TABLE Question6 (
  id INT NOT NULL AUTO_INCREMENT,
  RespondingUser VARCHAR(100) NOT NULL,
  Expert VARCHAR(100) NOT NULL,
  Project VARCHAR(45) NOT NULL ,
  PRIMARY KEY (id) 
);

CREATE  TABLE Question4 (
  id INT NOT NULL AUTO_INCREMENT,
  RespondingUser VARCHAR(100) NOT NULL,
  Project VARCHAR(45) NOT NULL ,
  ChoiceNum INT NOT NULL,
  Choice VARCHAR(100) NOT NULL,
  Points INT NOT NULL,
  PRIMARY KEY (id) 
);

CREATE VIEW Question4Summary AS
	SELECT RespondingUser, Project, 
	Max(IF(ChoiceNum=0,Points,0))  Choice0,
	Max(IF(ChoiceNum=1,Points,0))  Choice1,
	Max(IF(ChoiceNum=2,Points,0))  Choice2,
	Max(IF(ChoiceNum=3,Points,0))  Choice3,
	Max(IF(ChoiceNum=4,Points,0))  Choice4,
	Max(IF(ChoiceNum=5,Points,0))  Choice5,
	Max(IF(ChoiceNum=6,Points,0))  Choice6,
	Max(IF(ChoiceNum=7,Points,0))  Choice7
	FROM Question4 
	GROUP BY RespondingUser
;
