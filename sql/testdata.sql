DELETE FROM Users;
DELETE FROM Distance;

INSERT INTO Users(User,Password,Role,Name,Project) VALUES
('apmeneel@andymeneely.com', '6f1ed002ab5595859014ebf0951522d9', 'user', 'Andy Programmer', 'Developer Survey'),
('carter@andymeneely.com', '6f1ed002ab5595859014ebf0951522d9', 'user', 'Carter', 'Developer Survey'),
('hogan@andymeneely.com', '6f1ed002ab5595859014ebf0951522d9', 'user','Col. Hogan', 'Developer Survey'),
('kinch@andymeneely.com', '6f1ed002ab5595859014ebf0951522d9', 'user', 'Sgt. Kinchloe', 'Developer Survey'),
('lebeau@andymeneely.com', '6f1ed002ab5595859014ebf0951522d9', 'user', 'Lebeau', 'Developer Survey'),
('newkirk@andymeneely.com', '6f1ed002ab5595859014ebf0951522d9', 'user', 'Newkirk', 'Developer Survey')
;

INSERT INTO Distance(User1, User2, Distance) VALUES
('apmeneel@andymeneely.com', 'hogan@andymeneely.com', '1.2'),
('apmeneel@andymeneely.com', 'carter@andymeneely.com', '5.2'),
('apmeneel@andymeneely.com', 'lebeau@andymeneely.com', '5.2'),
('apmeneel@andymeneely.com', 'newkirk@andymeneely.com', '6.34'),
('apmeneel@andymeneely.com', 'kinch@andymeneely.com', '3.24'),
('carter@andymeneely.com', 'hogan@andymeneely.com', '10.4'),
('carter@andymeneely.com', 'kinch@andymeneely.com', '37.33'),
('carter@andymeneely.com', 'lebeau@andymeneely.com', '37.33'),
('carter@andymeneely.com', 'newkirk@andymeneely.com', '30.1'),
('hogan@andymeneely.com', 'kinch@andymeneely.com', '15.1'),
('hogan@andymeneely.com', 'lebeau@andymeneely.com', '37.33'),
('hogan@andymeneely.com', 'newkirk@andymeneely.com', '35.0'),
('kinch@andymeneely.com', 'lebeau@andymeneely.com', '50'),
('lebeau@andymeneely.com', 'newkirk@andymeneely.com', '50')
;




