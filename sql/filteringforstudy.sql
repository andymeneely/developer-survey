delete from survey where question=2;
delete from survey where User IN ('jmayer@loplof.de') AND Question=4;
delete from survey where User IN ('jmayer@loplof.de') AND Question=5;
delete from survey where User IN ('jmayer@loplof.de','jaap.keuter@xs4all.nl', 'ssufficool@gmail.com') AND Question=3;
delete from survey where id IN(35, 55, 177,175,174,61,73,15);
delete from survey where id IN(34, 56,77);
delete from survey where id IN(29, 180);
delete from survey where id IN(30, 57,117);
delete from survey where id IN(31,184,81,48,49);
delete from survey where id IN(182);
update survey set ANSWER='Guy Harris - guy@alum.mit.edu, Ulf Lamping - ulf.lamping@web.de, gerald@wireshark.org, , , ' WHERE ID=1