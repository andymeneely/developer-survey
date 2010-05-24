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
	WHERE strcmp(u1.user, u2.user)<0
;

CREATE VIEW AllDistances AS
SELECT uo.user1, uo.user2, IF(distance IS NULL, 100, distance) distance 
FROM distance d RIGHT OUTER JOIN UserCross uo
  ON (d.user1=uo.user1 AND d.user2=uo.user2);

  
  