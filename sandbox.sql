CREATE TABLE a(s1 VARCHAR(256), n INT );
CREATE TABLE b(s2 VARCHAR(256));


SELECT * FROM a,b;

SELECT s1 FROM a
UNION
SELECT * FROM b;

SELECT * FROM b
INTERSECT
SELECT s1 FROM a;



SELECT * FROM b
EXCEPT
SELECT s1 FROM a;

SELECT s1 FROM a
EXCEPT
SELECT * FROM b;


INSERT INTO a VALUES ('qwe', 5),('asd', 4),('zxc', 9);
INSERT INTO b VALUES ('qqq'),('asd'),('zzz');
INSERT INTO a VALUES ('sdf', 8), ('qqq', 8);


SELECT * FROM a
JOIN b ON a.s1=b.s2;

SELECT "b"."s2", "a"."n" FROM "b"
INNER JOIN "a" ON "b"."s2" = "a"."s1";