DELETE FROM Users;
DELETE FROM Distance;

INSERT INTO Users(User,Password,Role,Name,Project) VALUES
('apmeneel', '6f1ed002ab5595859014ebf0951522d9', 'user', 'Andy Programmer', 'Developer Survey'),
('carter', '6f1ed002ab5595859014ebf0951522d9', 'user', 'Carter', 'Developer Survey'),
('hogan', '6f1ed002ab5595859014ebf0951522d9', 'user','Col. Hogan', 'Developer Survey'),
('kinch', '6f1ed002ab5595859014ebf0951522d9', 'user', 'Sgt. Kinchloe', 'Developer Survey'),
('lebeau', '6f1ed002ab5595859014ebf0951522d9', 'user', 'Lebeau', 'Developer Survey'),
('newkirk', '6f1ed002ab5595859014ebf0951522d9', 'user', 'Newkirk', 'Developer Survey')
;

INSERT INTO Distance(User1, User2, Distance) VALUES
('apmeneel', 'hogan', '1.2'),
('apmeneel', 'carter', '5.2'),
('apmeneel', 'lebeau', '5.2'),
('apmeneel', 'newkirk', '6.34'),
('apmeneel', 'kinch', '3.24'),
('carter', 'hogan', '10.4'),
('carter', 'kinch', '37.33'),
('carter', 'lebeau', '37.33'),
('carter', 'newkirk', '30.1'),
('hogan', 'kinch', '15.1'),
('hogan', 'lebeau', '37.33'),
('hogan', 'newkirk', '35.0'),
('kinch', 'lebeau', '50'),
('lebeau', 'newkirk', '50')
;




