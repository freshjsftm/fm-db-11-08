--1 посчитать кол-во телефонов, которые были проданы
SELECT sum("quantity") FROM "phones_to_orders";
--2 посчитать кол-во телефонов, которые есть в магазине
SELECT sum("quantity") FROM "phones";
--3 посчитать среднюю стоимость телефонов
SELECT avg("price") FROM "phones";
--4 средняя цена каждого бренда
SELECT avg("price"), "brand" FROM "phones" GROUP BY "brand";
--5 средняя цена на Honor
SELECT avg("price"), "brand"
FROM "phones"
WHERE "brand" = 'Honor'
GROUP BY "brand";

--6 Кол-во моделей каждого бренда
SELECT count(*) AS "model's count", "brand"
FROM "phones"
GROUP BY "brand"
ORDER BY "model's count" DESC
LIMIT 1;

--7 кол-во заказов каждого пользователя
SELECT count("userId"), "userId" FROM "orders" GROUP BY "userId";

--8 стоимость всех телефонов бренда Sony
SELECT sum("price"*"quantity") AS "cost", "brand"
FROM "phones"
WHERE "brand" = 'Sony'
GROUP BY "brand";

--9 стоимость всех телефонов в диапазоне цен от 10000 до 20000
SELECT sum("price"*"quantity") AS "cost"
FROM "phones"
WHERE "price" BETWEEN 10000 AND 20000;

--10 отсортировать по росту и вывести рост и имя
-- ASC   DESC
SELECT "firstName", "height"
FROM "users"
ORDER BY "height" DESC, "firstName" ASC;

--11 вывести 10 позиций моделей телефонов, которых осталось меньше всего в магазине
SELECT * 
FROM "phones" 
ORDER BY "quantity" ASC
LIMIT 10;

--12 отсортировать пользователей по возрасту (30 - 40), по фамилии, по имени
SELECT "firstName", "lastName", extract("years" from age("birthday")) AS "age"
FROM "users"
WHERE extract("years" from age("birthday")) BETWEEN 30 AND 40
ORDER BY "age", "lastName", "firstName";

--13 преобразовать код выше - сделать таблицу в таблице
SELECT *
FROM (SELECT "firstName", 
          "lastName", 
          EXTRACT ("years" from age("birthday")) AS "age"
      FROM "users") AS "sa"
WHERE "sa"."age" BETWEEN 30 AND 32
ORDER BY "sa"."age" ASC, "lastName" ASC, "firstName" ASC;


--14 кол-во пользователей каждого возраста и отсортировать по возрасту
SELECT count(*), extract("years" from age("birthday")) AS "age"
FROM "users"
GROUP BY "age"
HAVING count(*)>15
ORDER BY "age";


SELECT * 
FROM "users"
WHERE "lastName" LIKE '%rr%';

SELECT * 
FROM "users"
WHERE "lastName" SIMILAR TO '%r{2}%';

SELECT * 
FROM "phones"
WHERE "brand" ILIKE 's%';


--15 найдите людей с инициалами 'EM'
SELECT * FROM "users" 
WHERE "firstName" ILIKE 'e%' AND "lastName" ILIKE 'm%';

--16 найдите все бренды, у которых кол-ко штук телефонов на складе > 8000
SELECT sum("quantity"), "brand"
FROM "phones"
GROUP BY "brand"
HAVING sum("quantity")>8000;
