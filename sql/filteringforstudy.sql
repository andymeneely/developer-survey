delete from survey where question=2;
delete from survey where User IN ('jmayer@loplof.de') AND Question=4;
delete from survey where User IN ('jmayer@loplof.de') AND Question=5;
delete from survey where User IN ('jmayer@loplof.de','jaap.keuter@xs4all.nl', 'ssufficool@gmail.com') AND Question=3;
delete from survey where id IN(35, 55, 177,175,174,61,73,15);
delete from survey where id IN(34, 56,77);
delete from survey where id IN(29, 180);
delete from survey where id IN(30, 57,117);
delete from survey where id IN(31,184,81,48,49);
delete from survey where id IN(182,14,184,190,217,218,367,370,358,449,472,790,766,316,553,230,306,753,239,241,398,257,451,700,601,602,450,319,760,477,701,702,704,467,350,359,612,277,282,287,586,780);
update survey set ANSWER='Guy Harris - guy@alum.mit.edu, Ulf Lamping - ulf.lamping@web.de, gerald@wireshark.org, , , ' WHERE ID=1;
update survey SET ANSWER='Gerald Combs - gerald@wireshark.org, stig@bjorlykke.org, , , , ' WHERE ID=64;
update survey set answer='Guy Harris - guy@alum.mit.edu, Anders Broman - anders.broman@ericsson.com, Stig Bjørlykke - stig@bjorlykke.org, Jaap Keuter - jaap.keuter@xs4all.nl, gerald@wireshark.org, ' where ID=6;
