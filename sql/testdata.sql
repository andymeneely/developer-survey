DELETE FROM Users;
DELETE FROM Distance;

INSERT INTO Users(User,Password,Role,Name,Project) VALUES
('apmeneel@andymeneely.com', 'test', 'user', 'Andy Programmer', 'Developer Survey'),
('carter@andymeneely.com', 'test', 'user', 'Carter', 'Developer Survey'),
('hogan@andymeneely.com', 'test', 'user','Col. Hogan', 'Developer Survey'),
('kinch@andymeneely.com', 'test', 'user', 'Sgt. Kinchloe', 'Developer Survey'),
('lebeau@andymeneely.com', 'test', 'user', 'Lebeau', 'Developer Survey'),
('newkirk@andymeneely.com', 'test', 'user', 'Newkirk', 'Developer Survey'),
('anotherguy@andymeneely.com', 'test', 'user', 'Another Guy', 'Another Project'),
('anotherguy2@andymeneely.com', 'test', 'user', 'Another Guy 2', 'Another Project'),
('anotherguy3@andymeneely.com', 'test', 'user', 'Another Guy 3', 'Another Project'),
('anotherguy4@andymeneely.com', 'test', 'user', 'Another Guy 4', 'Another Project'),
('anotherguy5@andymeneely.com', 'test', 'user', 'Another Guy 5', 'Another Project'),
('anotherguy6@andymeneely.com', 'test', 'user', 'Another Guy 6', 'Another Project'),
('anotherguy7@andymeneely.com', 'test', 'user', 'Another Guy 7', 'Another Project'),
('anotherguy8@andymeneely.com', 'test', 'user', 'Another Guy 8', 'Another Project'),
('anotherguy9@andymeneely.com', 'test', 'user', 'Another Guy 9', 'Another Project'),
('anotherguy10@andymeneely.com', 'test', 'user', 'Another Guy 10', 'Another Project'),
('anotherguy11@andymeneely.com', 'test', 'user', 'Another Guy 11', 'Another Project')
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




