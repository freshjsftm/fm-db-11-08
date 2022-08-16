
INSERT INTO "users" (
    "firstName",
    "lastName",
    "email",

    "isMale",
    "birthday",
    "height"
  )
VALUES 
('Jonny', 'Depp','depp@gmail.com', true, '1963/10/10',1.83),
('Jared', 'Leto','leto@gmail.com', true, '1969/10/10',1.83);

--вывести айди всех пользователей, которые делали заказы
SELECT id FROM "users"
INTERSECT
SELECT "userId" FROM "orders";

--вывести айди всех пользователей, которые НЕ делали заказы
SELECT id FROM "users" --502
EXCEPT
SELECT "userId" FROM "orders";  --500

SELECT "userId" FROM "orders" --500
EXCEPT
SELECT id FROM "users" --502



--получить заказы конкретного (110) пользователя

SELECT "u"."email", "u"."isMale", "o"."id"
FROM "users" AS "u"
JOIN "orders" AS "o" ON "u"."id"="o"."userId"
WHERE "u"."id"= 338;


SELECT "u"."email", "u"."isMale", "o"."id"
FROM "users" AS "u", "orders" AS "o"
WHERE "u"."id"="o"."userId" AND "u"."id"= 338;



--все айди заказов с Sony

SELECT "o"."id", "p"."brand", count("p"."model") AS "count"
FROM "orders" AS "o"
  JOIN "phones_to_orders" AS "pto" ON "o"."id"="pto"."orderId"
  JOIN "phones" AS "p" ON "pto"."phoneId" = "p"."id"
WHERE "p"."brand" ILIKE 'sony'
GROUP BY "o"."id", "p"."brand"
HAVING count("p"."model")=4
ORDER BY "o"."id";


INSERT INTO "phones" ("brand","model","price","quantity")
VALUES ('Musk', 'X500', 51230, 3), ('Musk', 'X503', 57230, 2);


--все бренды телефонов, которые покупают, отсортировать по алфавиту
SELECT "p"."brand" 
FROM "phones" AS "p"
JOIN "phones_to_orders" AS "pto" ON "p"."id" = "pto"."phoneId"
JOIN "orders" AS "o" ON "pto"."orderId" = "o"."id"
GROUP BY "p"."brand"
ORDER BY "p"."brand";

SELECT DISTINCT "p"."brand" 
FROM "phones" AS "p"
JOIN "phones_to_orders" AS "pto" ON "p"."id" = "pto"."phoneId"
JOIN "orders" AS "o" ON "pto"."orderId" = "o"."id";



SELECT "p"."model","p"."brand"
FROM "phones_to_orders" AS "pto"
INNER JOIN "phones" AS "p" ON "pto"."phoneId"= "p"."id" --49
GROUP by "p"."model","p"."brand";


SELECT "p"."model","p"."brand"
FROM "phones_to_orders" AS "pto"
FULL JOIN "phones" AS "p" ON "pto"."phoneId"= "p"."id" --52
GROUP by "p"."model","p"."brand";

SELECT "p"."model","p"."brand"
FROM "phones_to_orders" AS "pto"
FULL OUTER JOIN "phones" AS "p" ON "pto"."phoneId"= "p"."id" --52
GROUP by "p"."model","p"."brand";

SELECT "p"."model","p"."brand"
FROM "phones_to_orders" AS "pto"
  LEFT JOIN "phones" AS "p" ON "pto"."phoneId"= "p"."id" --49
GROUP by "p"."model","p"."brand";


SELECT "p"."model","p"."brand"
FROM "phones" AS "p"
  LEFT JOIN "phones_to_orders" AS "pto" ON "pto"."phoneId"= "p"."id" --52
GROUP by "p"."model","p"."brand";


SELECT "p"."model","p"."brand"
FROM "phones_to_orders" AS "pto"
  RIGHT JOIN "phones" AS "p" ON "pto"."phoneId"= "p"."id" --52
GROUP by "p"."model","p"."brand";


SELECT "p"."model","p"."brand"
FROM "phones" AS "p"
  RIGHT JOIN "phones_to_orders" AS "pto" ON "pto"."phoneId"= "p"."id" --49
GROUP by "p"."model","p"."brand";


SELECT "p"."model","p"."brand"
FROM "phones_to_orders" AS "pto"
  RIGHT JOIN "phones" AS "p" ON "pto"."phoneId"= "p"."id" --0
  WHERE "pto"."phoneId" IS NULL
GROUP by "p"."model","p"."brand";


SELECT "p"."model","p"."brand"
FROM "phones" AS "p"
  LEFT JOIN "phones_to_orders" AS "pto" ON "pto"."phoneId"= "p"."id" --3
  WHERE "pto"."phoneId" IS NULL
GROUP by "p"."model","p"."brand";




--1)выбрать почты пользователей, которые покупают айфон
SELECT "u"."email", "p"."brand"
FROM "users" AS "u"
  JOIN "orders" AS "o" ON "u"."id"="o"."userId"
  JOIN "phones_to_orders" AS "pto" ON "o"."id" = "pto"."orderId"
  JOIN "phones" AS "p" ON "pto"."phoneId" = "p"."id"
  WHERE "p"."brand" ILIKE 'i%e'
GROUP BY "u"."email", "p"."brand"
ORDER BY "u"."email"

